class UsersController < ApplicationController
    
    def register
        @user = User.new
        @user.build_customer
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            flash[:notice] = "Account Created Successfully"
            redirect_to root_path
        else
            flash.now[:danger] = "Please enter all the fields"
            render 'register'
        end
            
    end

    
    def edit_account
        @user = User.find(params[:id])
    end

        
    
    def home
        
    end
    
    def login
        
    end
    
    def logout
        session[:user_id] = nil
        flash[:success] = "logout successfully"
        redirect_to root_path
        
    end
    
    def create_session
        user = User.find_by_email(params[:email])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "Logged in successfully"
            redirect_to root_path
        else
            flash[:danger] = "either username or password is wrong"
            render 'login'
        end
    end
    
    
    private
    
    def user_params
        params.require(:user).permit(:email, :password,:user_type,:customer_attributes=> [:full_name])
            
            
    end
end
