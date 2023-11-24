# frozen_string_literal: true

class BooksController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    begin
      @books = Book.all
      render json: @books
    rescue => e
      p "Error get all book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def create
    begin
      book = Book.create!(book_params)
      render json: book, status: :created
    # Another method: Book.create(book_params)
    #   if book.errors.any?
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
      book = Book.find(params[:id])
      result = book.update(book_params)
      if result
        render json: { success: true }, status: :ok
      end
    rescue ActiveRecord::RecordInvalid => e #  Error: Validation failed
      render json: { error: e.message }, status: :bad_request # or status: :unprocessable_entity
    rescue => e
      p "Error update book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def show
    begin
      book = Book.find(params[:id])
      render json: book
    rescue => e
      p "Error get one book: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def book_params
    params.permit(:title, :author, :price, :published_date, :description)
  end

end
