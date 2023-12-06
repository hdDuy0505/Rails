# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    begin
      books_params = get_books_params
      per_page = books_params[:per_page] || 5
      page = books_params[:page] || 1
      @books = Book.limit(per_page.to_i).offset((page - 1).to_i * per_page)

      serialized_books = ActiveModelSerializers::SerializableResource.new(@books, each_serializer: BookListSerializer)
      #ActiveModel::ArraySerializer.new(@event_query, each_serializer: EventListSerializer)
      render json: { books: serialized_books, total: Book.count, per_page: per_page, page: page }
    rescue => e
      p "Error get all book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def create
    begin
      @book = Book.create!(book_params)
      render json: @book, status: :created
    # Another method: Book.create(book_params)
    #   if @book.errors.any?
    #     raise ActiveModel::ValidationError.new(book)
    #   end
    # rescue ActiveModel::ValidationError => e
    #   render json: { error: e.message }, status: :unprocessable_entity
    rescue ActiveRecord::RecordInvalid => e #  Error: Validation failed
      render json: { error: e.message }, status: :bad_request # or status: :unprocessable_entity
    rescue => e
      p "Error create book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def update
    begin
      @book = Book.find(params[:id])
      result = @book.update!(book_params)
      if result
        render json: { success: true }, status: :ok
      end

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :bad_request
    rescue ActiveRecord::RecordInvalid => e #  Error: Validation failed
      render json: { error: e.message }, status: :bad_request # or status: :unprocessable_entity
    rescue => e
      p "Error update book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def show
    begin
      book = Book.includes({ comments: [:owner] }).find(params[:id]) # rails hasn't find!
      render json: book # default: render json: book, serializer: BookSerializer, status: :ok

    # default: render json: comment, serializer: CommentSerializer, status: :ok
    # tự map tới CommentSerializer
    # comment = Comment.includes(:owner).find_by(id: params[:id])
    # Or: comment = Comment.where(id: params[:id]).includes(:owner)
    # render json: comment

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :bad_request
    rescue => e
      p "Error get one book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def update_book_comment
    begin
      book = Book.find(update_book_comment_params[:book_id])
      comment = Comment.find(update_book_comment_params[:comment_id])

      ActiveRecord::Base.transaction do
        book.update!(update_book_comment_params.except(:comment, :comment_id, :book_id))
        comment.update!(update_book_comment_params.slice(:comment))
      end

      render json: { success: true }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :bad_request
    rescue => e
      p "Error update book comment: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  private def book_params
    params.permit(:title, :author, :price, :published_date, :description) # body => get from params
  end

  private def get_books_params
    params.permit(:per_page, :page) # ?per_page=10&page=1 => get from params
  end

  private def update_book_comment_params
    params.permit(:book_id, :comment_id, :title, :author, :price, :published_date, :description, :comment)
  end
end
