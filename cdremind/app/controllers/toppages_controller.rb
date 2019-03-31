class ToppagesController < ApplicationController

  def index
    @ranking_counts = Relationship.ranking
    @items = Item.find(@ranking_counts.keys)
  end
end
