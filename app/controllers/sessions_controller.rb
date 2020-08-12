class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully!"
            if current_user.admin?
                redirect_to place_orders_path
            else
                redirect_to index_path
            end
        else
            flash.now[:alert] = "Ops! Something went wrong with your login details."
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You've just logged out! See you soon!"
        redirect_to root_path
    end

end