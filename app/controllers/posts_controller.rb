class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "Object successfully created"
      redirect_to root_path
    else
      flash.now[:error] = "Something went wrong"
      render "new"
    end
  end

  def index
    @posts = Post.all
  end


  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
