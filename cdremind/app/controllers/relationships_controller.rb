class RelationshipsController < ApplicationController
  def create
    
    @item = Item.find_or_initialize_by(jan: params[:jan])
    
    unless @item.persisted?
    
      results = RakutenWebService::Books::CD.search(jan: @item.jan)
      
      @item = Item.new(read(results.first))
      @item.save
    end 
    
    current_user.remind(@item)
    flash[:success] = 'リマインドしました'
    redirect_back(fallback_location: root_path)
      
  end

  def destroy
    @item = Item.find(params[:item_id])
    current_user.unremind(@item)
    flash[:success] = 'リマインドを解除しました'
    redirect_back(fallback_location: root_path)
  end
  
end
