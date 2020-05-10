class UsersController < ApplicationController

  before_action :set_user, only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def index
    @users = User.paginate(page: params[:page],per_page: 5)
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to the Rails Blog #{@user.username}"
        format.html { redirect_to root_path }
      else
        format.html { render action: "new" }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success]="User Updated Successfully"
      redirect_to articles_path
    else
      render :edit
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page],per_page: 3)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all article created by user have been deleted successfully"
    redirect_to users_path
  end
  

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:danger]="You can only edit your own account"
        redirect_to root_path
      end
      
    end

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only Admin user can perform this action"
        redirect_to root_path
      end
    end
    
    
end