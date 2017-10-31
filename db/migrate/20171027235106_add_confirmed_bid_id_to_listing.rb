class AddConfirmedBidIdToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :comfirmed_bid_id, :integer
  end
end
