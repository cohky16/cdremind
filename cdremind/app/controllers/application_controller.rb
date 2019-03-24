class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end 
  end
  
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
