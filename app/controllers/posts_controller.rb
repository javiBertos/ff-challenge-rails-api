class PostsController < ApplicationController
  before_filter :add_cors_headers

  def add_cors_headers
    origin = request.headers["Origin"]
    unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
      origin = "https://ff-challenge-rails-api.herokuapp.com"
    end

    headers['Access-Control-Allow-Origin'] = origin
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'

    allow_headers = request.headers["Access-Control-Request-Headers"]
    if allow_headers.nil?
      #shouldn't happen, but better be safe
      allow_headers = 'Origin, Authorization, Accept, Content-Type'
    end

    headers['Access-Control-Allow-Headers'] = allow_headers
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def index
    @posts = Post.all()

    render json: @posts
  end

  def create
    @post = Post.new(params[:post])

    render json: @post
  end

  def show
    @post = Post.find(params[:id])

    if stale?(last_modified: @post.updated_at, public: true)
      render json: @post
    end
  end

  def update
    post = Post.find(params[:id])

    render json: params[:post]
  end

  def destroy
    post = Post.find(params[:id])

    post.destroy
  end
end
