class UsersController < ApplicationController
  #By default, before filters apply to every action in a controller, so here we
  #restrict the filter to act only on the :edit and :update actions by passing
  #the appropriate :only options hash.
  before_filter :signed_in_user, only:[:index, :edit, :update, :destroy]  
  before_filter :correct_user,   only:[:edit, :update]
  before_filter :admin_user,     only: :destroy
  def show
  	@user = User.find(params[:id])
  end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		#Handle a succesful save
  		flash[:success] = "Welcome to the website"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
  #  sign_out
  #  redirect_to root_url
  end

  def destroy
        User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  def edit
  end 

  def update
    if @user.update_attributes(params[:user])
      #Handle a succesful update
      flash.now[:success] = "Profile Updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end
  private

  def signed_in_user
    store_location  
    redirect_to signin_url, notice: "Please Sign in." unless signed_in?
  end 

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  end
  