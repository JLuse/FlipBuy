class User < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :bids, through: :listings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates_uniqueness_of :username
end
