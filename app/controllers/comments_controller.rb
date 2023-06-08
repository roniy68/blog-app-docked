class CommentsController < ApplicationController
    def create
      @comment = Comment.create(
        user_id: current_user.id,
        post_id: params['id'],
        text: params['text']
      )
  
      redirect_to user_post_path(current_user, @comment.post)
    end
  end
  