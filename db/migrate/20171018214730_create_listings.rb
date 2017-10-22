class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :picture
      t.text :description
      t.string :condition
      t.string :asking_price
      t.string :username

      t.timestamps
    end
  end
end
