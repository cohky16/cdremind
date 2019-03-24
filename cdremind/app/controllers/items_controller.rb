class ItemsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @items = []
    
    @artistName= params[:artistName]
    if @artistName.present?
      results = RakutenWebService::Books::CD.search({
        artistName: @artistName,
        imageFlag: 1,
        hits: 28,
        page: 1,
        sort: '-releaseDate'
      })
      
      results.each do |result|
        item = Item.find_or_initialize_by(read(result))
        @items << item
      end 
    end 
  end
end
