class RemoveConfirmedBidToListing < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :comfirmed_bid, :integer
  end
end
