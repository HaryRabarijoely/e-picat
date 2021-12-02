module Admin

  class UsersController < AdminController
    before_action :is_admin?

    def index
      @users = User.order(:id)
    end

    def new
      @user = User.new
    end

    def show
      @user = User.find(params:[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
        if @user.update!(user_params)
          flash[:success] = "L'utilisateur a bien été mis à jour."
          redirect_to admin_users_path
        else
          flash[:warning] = "Il y a eu un problème lors de la mise à jour de l'utilisateur"
          render 'edit'
        end
    end
    
    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = "L'utilisateur a bien été supprimé."
        redirect_to admin_users_path
      else
        flash[:warning] = "Il y a eu un problème lors de la suppression de l'utilisateur"
        redirect_to admin_users_path
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :admin)
    end
  
    def is_admin?
      unless user_signed_in? && current_user.admin
        flash[:danger] = "Vous n'avez pas la permission d'accéder à cette page"
        redirect_to root_path
      end
    end
  end
end
