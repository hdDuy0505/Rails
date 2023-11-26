# frozen_string_literal: true
class CommentsController < ApplicationController
  def create
    begin
      book = Book.find(comment_params[:book_id])
      user = User.find(session[:current_user]['id'])
      @comment = Comment.create!(comment_params.merge(owner_id: session[:current_user]['id']))
      render json: @comment, status: :created

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :bad_request
    rescue ActiveRecord::RecordInvalid => e #  Error: Validation failed
      render json: { error: e.message }, status: :bad_request # or status: :unprocessable_entity
    rescue => e
      p "Error create comment: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  private def comment_params
    params.permit(:book_id, :comment)
  end
end
