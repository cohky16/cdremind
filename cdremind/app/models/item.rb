class Item < ApplicationRecord
  validates :jan, presence: true, length: { maximum: 255 } 
  validates :title, presence: true, length: { maximum: 255 }
  validates :artist_name, presence: true, length: { maximum: 255 }
  validates :sales_date, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
  validates :item_url, presence: true, length: { maximum: 255 }
  validates :availability, presence: true, length: { maximum: 255 }
  
  has_many :remind_users, through: :relationships, source: :user
  has_many :relationships
 
end
