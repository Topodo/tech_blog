class RemoveVisitsCountFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :visits_count, :integer
  end
end
