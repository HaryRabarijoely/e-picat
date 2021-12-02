module Admin
  class OrdersController < AdminController
    before_action :is_admin?

    def index
      @orders = Order.order(id: :desc)
    end

    def show
      @order = Order.find(params[:id])
    end
   
    private

    def is_admin?
      unless user_signed_in? && current_user.admin
        flash[:danger] = "Vous n'avez pas la permission d'accéder à cette page"
        redirect_to root_path
      end
    end
  end
end
  