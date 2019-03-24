class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :relationships
  has_many :remind_items, through: :relationships, source: :item
  
  def remind(other_item)
    self.relationships.find_or_create_by(item_id: other_item.id)
  end 
    
  def unremind(other_item)
    remind = self.relationships.find_by(item_id: other_item.id)
    remind.destroy if relationships
  end 
    
  def remind?(other_item)
    self.remind_items.include?(other_item)
  end 
end
