class ChangeDataTypeForAskingPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :listings, :asking_price, :decimal, precision: 8, scale: 2
  end
end
