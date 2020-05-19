class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.image.attach(io: image_io, filename: image_name)

    unless @post.save
      puts @post.errors.inspect
      render json: { error: "Unable to create post" }, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def image_io
    decoded_image = Base64.decode64(params[:post][:image])
     StringIO.new(decoded_image)
  end

  def image_name
    params[:post][:file_name]
  end
end
