class AddPaperclipToBid < ActiveRecord::Migration[5.1]
  def change
    add_attachment :bids, :image
  end
end
