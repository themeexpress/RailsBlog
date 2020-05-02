class RecentpostController < ApplicationController
  def show
    @recent_post = Article.order(created_dt: :desc).limit(5)
  end
end
