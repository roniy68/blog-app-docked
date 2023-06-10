class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id

  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_defaults
  after_save :update_posts_counter

  def recent_comments
    comments(5)
  end

  def comments(limit = nil)
    Comment.includes(:user).where(post_id: id).order(created_at: :desc).limit(limit)
  end

  private

  def update_posts_counter
    user = User.find(author_id)
    user.update(posts_counter: user.posts.count)
  end

  def set_defaults
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
