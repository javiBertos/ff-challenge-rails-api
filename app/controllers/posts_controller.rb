class PostsController < ApplicationController
  def index
    @posts = Post.all()

    render json: @posts
  end

  def create
    post = Post.new(post_params)

    if post.valid? and post.save
      render json: post, status: 201
    else
      render json: post.errors.messages, status: 422
    end
  end

  def show
    post = Post.find(params[:id])

    render json: post
  end

  def update
    post = Post.find(params[:id])

    if post.valid? and post.update_attributes(post_params)
      render status: 204
    else
      render json: post.errors.messages, status: 422
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    render status: 204
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :lat, :long, :image_url)
  end
end
