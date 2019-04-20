class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def self.ranking
    self.where("sales_date > date_format(current_date(),'%Y年%m月%d日')").group(:item_id).order('count_item_id DESC').limit(12).count(:item_id)
  end 
  
end
