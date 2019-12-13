class AddVisitsCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :visits_count, :integer, :default => 0
    #Ex:- :default =>''
  end
end
