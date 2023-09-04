class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototype = @user.prototype
  end
  
end
