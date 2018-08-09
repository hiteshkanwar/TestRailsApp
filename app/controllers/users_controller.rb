class UsersController < ApplicationController

  def index
  	@users = User.all.paginate(:page => params[:page], :per_page => 3)
    if params[:q].present?
      @users = @users.where("email LIKE ?", "%#{params[:q]}%")
    end
  	render :json => {:users => @users}
  end

  def delete
   	@user = User.find(params[:id]).delete
   	render :json => {:user => @user}
  end

  def create
    user = User.new(email: params[:email],password: params[:password])
    user.create_token
    if user.save
      render json: {success: "user created successfully", user: user},status: 200
    else
      render json: {error: user.errors.full_messages},status: 400 
    end
  end


  def update
    user = User.find(params[:id])
    user.update(email: params[:email],password: params[:password])
    if user
      render json: {success: "user updated successfully", user: user},status: 200
    else
      render json: {error: user.errors.full_messages},status: 400 
    end

  end

end
