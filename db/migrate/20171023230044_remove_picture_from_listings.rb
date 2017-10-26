class RemovePictureFromListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :picture, :string
  end
end
