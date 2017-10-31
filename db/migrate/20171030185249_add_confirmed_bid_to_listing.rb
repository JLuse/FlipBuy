class AddConfirmedBidToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :comfirmed_bid, :integer
  end
end
