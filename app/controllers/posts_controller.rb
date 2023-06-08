class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params['user_id'])
    @posts = Post.where(author_id: params['user_id'])
  end

  def show
    @post = Post.find_by(id: params['id'], author_id: params['user_id'])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(
      author_id: current_user.id,
      title: params['post']['title'],
      text: params['post']['text']
    )

    redirect_to user_post_path(current_user, @post)
  end
end
