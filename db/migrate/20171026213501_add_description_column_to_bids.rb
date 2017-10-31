class AddDescriptionColumnToBids < ActiveRecord::Migration[5.1]
  def change
    add_column :bids, :description, :text
  end
end
