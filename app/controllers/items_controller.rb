class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def items_params
    params.require(:item).permit(:name, :text, :price).merge(user_id: current_user.id)
  end

end
