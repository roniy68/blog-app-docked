class LikesController < ApplicationController
  def create
    post_id = params['post_id']
    @post = Post.find_by(id: post_id)

    Like.create(user_id: current_user.id, post_id:)

    redirect_to user_post_path(@post.author_id, @post)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
