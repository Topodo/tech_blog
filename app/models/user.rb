class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :timeout_in => 60.minutes
  has_many :posts

  def get_posts_desc
    self.posts.sort_by { |post| -post.visits_count }
  end
end
