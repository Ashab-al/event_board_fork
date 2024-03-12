class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy, :destroy_all]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @article.comments.build(comment_params)

    if @new_comment.save
      redirect_to @article, notice: I18n.t('controllers.comments.created')
    else
      redirect_to 'article/show', notice: I18n.t('controllers.comments.error')
    end
  end

  def destroy
    authorize @comment
    @comment.destroy!

    redirect_to article_path(@article), alert: I18n.t('controllers.comments.destroyed')
  end

  def destroy_all
    @comments = @article.comments
    authorize @comments unless @article.comments.empty?

    @comments.destroy_all

    redirect_to article_path(@article), notice: I18n.t('controllers.comments.destroyed_all')
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment)
          .permit(:body, :user_name)
          .merge(article_id: params[:article_id], user: current_user)
  end
end
