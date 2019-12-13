class Topic < ApplicationRecord
    has_many :posts

    def get_posts_desc
        self.posts.sort_by { |post| -post.visits_count }
    end
end