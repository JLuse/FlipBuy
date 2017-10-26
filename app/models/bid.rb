class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  #paper clip image upload
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
