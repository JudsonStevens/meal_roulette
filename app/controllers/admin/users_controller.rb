class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render '/admin/users/new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if User.update(name: user_params[:name], username: user_params[:user_name], password: 'newpass')
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
      else
        format.html { render 'admin/users/edit' }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
