class AddProfileToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :contact_number, :string
    add_column :users, :location, :string
    add_column :users, :rating, :integer
    add_column :users, :profile_pic, :attachment
  end
end
