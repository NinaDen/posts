class HistoryItemsController < ApplicationController
  def index
    @history_items = HistoryItem.all.page params[:page]
  end
end
