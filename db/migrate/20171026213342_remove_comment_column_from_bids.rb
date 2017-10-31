class RemoveCommentColumnFromBids < ActiveRecord::Migration[5.1]
  def change
    remove_column :bids, :comment, :text
  end
end
