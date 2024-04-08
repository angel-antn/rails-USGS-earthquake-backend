class Api::CommentsController < ApplicationController
  before_action :set_earthquake

  def index
    @comments = @earthquake.comments
    render json: @comments, status: :ok
  end

  def create
    @body = params[:body]
    if(@body.nil? || @body.empty?)
      render json: {error: 'post should only have body for the text of the comment and shouldn\'t be empty'}, status: :bad_request
      return
    end
    @comment = @earthquake.comments.new(body: @body)
    if @comment.save
      render :create, status: :ok
    else
      render json: {error: 'Error trying to create the comment'}, status: :internal_server_error
    end
  end

  private

  def set_earthquake
    @earthquake = Earthquake.find_by(id: params[:feature_id])
    render json: { error: 'Earthquake not found' }, status: :not_found unless @earthquake
  end
end

