class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save 
      flash[:success] = "Successfully created..."
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  def show
    @article=Article.find(params[:id])
  end
  def edit
    @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      flash[:success]="Article update successfully"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Successfully deleted"
    redirect_to articles_path
  end
  private 
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
