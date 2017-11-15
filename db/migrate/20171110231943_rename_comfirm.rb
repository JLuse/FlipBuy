class RenameComfirm < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :comfirmed_bid_id, :confirmed_bid_id
  end
end
