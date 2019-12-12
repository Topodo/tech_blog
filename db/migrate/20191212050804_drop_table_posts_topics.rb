class DropTablePostsTopics < ActiveRecord::Migration[5.1]
  def change
    drop_table :posts_topics
  end
end
