class RankingsController < ApplicationController
  def remind
    @ranking_counts = Relationship.ranking
    @items = Item.find(@ranking_counts.keys)
  end
end
