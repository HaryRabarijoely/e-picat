module Admin

    class EventSubmissionsController < AdminController
      before_action :is_site_admin?
  
      def index
        @events = Event.where(validated: nil)
      end
  
      def update
        @event = Event.find(params[:id])
          if @event.update!(validated: true)
            flash[:success] = "L\'évènement a bien été validé."
            redirect_to admin_event_submissions_path
          else
            flash[:warning] = "Something went wrong"
            render 'index'
          end
      end
      
      def destroy
        @event = Event.find(params[:id])
        if @event.destroy
          flash[:success] = 'L\'évènement a bien été supprimé.'
          redirect_to admin_event_submissions_path
        else
          flash[:warning] = 'Something went wrong'
          redirect_to admin_event_submissions_path
        end
      end
  
      private
  
    
      def is_site_admin?
        unless user_signed_in? && current_user.site_admin
          flash[:danger] = 'Vous n\'avez pas la permission d\'accéder à cette page'
          redirect_to root_path
        end
      end
    end
  end
  