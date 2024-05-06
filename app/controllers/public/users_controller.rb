class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @post_new = Post.new
    @post = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def index
    @user = current_user
    @users = User.all
    @post_new = Post.new
  end
  
  def withdrawal
    @user = current_user
  end
  
  def delete
    current_user.update!(is_active: false)
    current_user.posts.destroy_all
    sign_out
    redirect_to root_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :review)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end

