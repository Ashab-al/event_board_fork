class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show]
  before_action :set_current_user_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @user = @article.user
    @event = @article.event
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.build
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: I18n.t('controllers.articles.created')
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: I18n.t('controllers.articles.updated')
    else
      render :edit
    end
  end

  def destroy
    message = {notice: I18n.t('controllers.articles.destroyed')}

    if current_user_can_edit_(@article)
      @article.destroy!
    else
      message = {alert: I18n.t('controllers.articles.error')}
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def set_current_user_article
      begin
        @article = current_user.articles.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to user_path(current_user), notice: I18n.t('controllers.articles.cant_change')
      end
    end

    def article_params
      params.require(:article).permit(:title, :body, :picture, :event_id)
    end
end
