class RemoveConfirmedBidIdToListing < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :comfirmed_bid_id, :integer
  end
end
