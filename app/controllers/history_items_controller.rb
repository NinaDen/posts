class HistoryItemsController < ApplicationController
  def index
    @history_items = HistoryItem.all
  end
end
