class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.expect(post: [ :content ])
    end
end
