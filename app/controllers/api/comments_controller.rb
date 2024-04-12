class Api::CommentsController < AuthController
  skip_before_action :authenticate_request, only: [:index]
  before_action :set_earthquake, only: [:index, :create]

  def index
    if params[:user_id]
      comments = @earthquake.comments.where(is_active: true, user_id: params[:user_id])
    else
      comments = @earthquake.comments.where(is_active: true)
    end
    render json: comments, status: :ok
  end

  def create
    
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.jwt_decode(header)
    @current_user = User.find(decoded[:user_id])

    @body = params[:body]
    puts @body
    if(@body.nil? || @body.empty?)
      render json: {error: 'post should only have body for the text of the comment and shouldn\'t be empty'}, status: :bad_request
      return
    end
    comment = @earthquake.comments.new(body: @body, is_active: true, user_id: @current_user.id)
    if comment.save
      render :create, status: :ok
    else
      render json: {error: 'Error trying to create the comment'}, status: :internal_server_error
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], is_active: true )
    if comment.nil?
      render json: {error: 'Comment not found'}, status: :not_found
      return
    else
      if comment.update(is_active: false)
        render json: {error: 'Comment was deleted'}, status: :ok
      else
        render json: {error: "Comment couldn't be deleted"}, status: :unprocessable_entity
      end
      
      return
    end
  end

  private

  def set_earthquake
    @earthquake = Earthquake.find_by(id: params[:feature_id])
    render json: { error: 'Earthquake not found' }, status: :not_found unless @earthquake
    
  end
end

