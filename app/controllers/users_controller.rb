#encoding: utf-8
class UsersController < ApplicationController
  def register
      @user = User.new
      render 'register', layout: 'register'
    
  end

  def register_confirm
      @user = User.new params.require(:user).permit(:username,:em    ail,:password,:password_confirmation)
      if @user.save
          to_login @user
          redirect_to root_path
      else
          render 'register', layout: 'register'
      end
    
  end

  def login
    
  end

  def login_confirm
    
  end

  def logout
    
  end

  protected

  def to_login(user)
   
  end
end
