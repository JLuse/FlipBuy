class Listing < ApplicationRecord
  belongs_to :user
  has_many :bids
  belongs_to :confirmed_bid, class_name: 'Bid'
  #paper clip image upload
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
