class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.decimal :price, precision: 8, scale: 2
      t.text :comment
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
