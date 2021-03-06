module Admin
  class ItemsController < AdminController
    before_action :is_admin?

    def index
      @items = Item.order(:id)
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(
      title: params[:title],
      description: params[:description],
      price: params[:price],
      available: params[:available]
      )
      if @item.save
        @item.picture.attach(params[:picture])
        flash[:success] = "Le produit a bien été ajouté."
        redirect_to(admin_items_path)
      else
        flash[:warning] = "Il y a eu un problème lors de la création du produit."
        render new_admin_item_path
      end
    end  

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update!(item_params)
        flash[:success] = "Le produit a bien été mis à jour."
        redirect_to admin_items_path
      else
        flash[:warning] = "Il y a eu un problème lors de la mise à jour du produit"
        render 'edit'
      end
    end
    
    def destroy
      @item = Item.find(params[:id])
      if @item.destroy
        flash[:success] = "Le produit a bien été supprimé."
        redirect_to admin_items_path
      else
        flash[:warning] = "Il y a eu un problème lors de la suppression"
        redirect_to admin_items_path
      end
    end

    private

    def item_params
      params.require(:item).permit(:title, :description, :price, :picture, :available)
    end
  
    def is_admin?
      unless user_signed_in? && current_user.admin
        flash[:danger] = "Vous n'avez pas la permission d'accéder à cette page"
        redirect_to root_path
      end
    end
  end
end
  