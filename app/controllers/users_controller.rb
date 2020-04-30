class UsersController < ApplicationController

  before_action :set_user, only: [:edit,:update,:show]

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
        flash[:success] = 'user was successfully created.'
        format.html { redirect_to articles_path }
        format.xml { render xml: @user, status: :created, location: @user }
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
    @user_articles = @user.articles.paginate(page: params[:page],per_page: 1)
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
    
  

end