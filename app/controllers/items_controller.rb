class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

#########################################
#########################################
# Fonctions à supprimer quand le 
# dashboard admin sera fini
# Ainsi que /app/views/new.html.erb

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(
      title: params[:title],
      description: params[:description],
      price: params[:price]
    )
    @item.picture.attach(params[:picture])
    redirect_to(item_path(@item))
  end  
#########################################
#########################################

  # GET /items or /items.json
  def index
    @items = Item.where(available: true)
  end

  # GET /items/1 or /items/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :price)
    end
end
