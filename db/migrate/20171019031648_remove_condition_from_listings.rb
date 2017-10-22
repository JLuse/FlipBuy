class RemoveConditionFromListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :condition, :string
  end
end
