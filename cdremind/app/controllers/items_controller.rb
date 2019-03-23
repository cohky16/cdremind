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
        pageCount: 100,
        sort: '-releaseDate'
      })
      
      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end 
    end 
  end
  
  private
  
  def read(result)
    jan = result['jan']
    title = result['title']
    artist_name = result['artistName']
    sales_date = result['salesDate']
    image_url = result['largeImageUrl']
    item_url = result['itemUrl']
    availability = result['availability']
    {
      jan: jan,
      title: title,
      artist_name: artist_name,
      sales_date: sales_date,
      image_url: image_url,
      item_url: item_url,
      availability: availability
    }
  end 
end
