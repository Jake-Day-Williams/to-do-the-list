class ListItemsController < ApplicationController
  before_action :set_list
  before_action :set_list_item, except: [:create]
  
  def create
    @item = @list.list_items.create(list_item_params)
    redirect_to @list
  end
    
  def destroy
    if @list_item.destroy
      flash[:success] = "List item was deleted."
    else
      flash[:error] = "Item could not be deleted."
    end
    redirect_to @list
  end
  
  def complete
    @list_item.update_attribute(:completed_at, Time.now)
    redirect_to @list, notice: "Item Completed"
  end
    
  private
    
  def set_list
      @list = List.find(params[:list_id])
  end
    
  def list_item_params
      params[:list_item].permit(:content)
  end
  
  def set_list_item
    @list_item = @list.list_items.find(params[:id])
  end
    
end