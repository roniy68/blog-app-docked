class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

  def update_likes_counter
    post = Post.find(post_id)
    post.update(likes_counter: post.likes.count)
  end
end
