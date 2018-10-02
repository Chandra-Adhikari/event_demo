class SessionsController < ApplicationController
	def new
    	redirect_to home_index_path if current_user.present?
    end

  	def create
	    if @user = Admin.find_by(email: params[:session][:email])
	        if @user && @user.valid_password?(params[:session][:password])
	  			session[:user_id] = @user.id
	            flash[:notice] = "You have successfully logged In."
	            redirect_to homes_path
	        else
	       		redirect_to login_path
	          flash[:error] = "Invalid Email or Password"
	        end
	    else
	      redirect_to login_path
	      flash[:error] = "Invalid Email, Please try again."
	    end
	end

	def destroy
	    session[:user_id] = nil
	    flash[:success] = "You have successfully logged out."
	    redirect_to login_path
	end

end
