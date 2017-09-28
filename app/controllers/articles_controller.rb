require 'utilise'

class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @collection = Collection.find(params[:collection_id])
    @article    = @collection.articles.new
    @revision   = @article.revisions.new
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @article    = @collection.articles.new(article_params)
    @revision   = @article.revisions.new(revision_params)

    if @article.save && @revision.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @revision = @article.revisions.last
  end

  def edit
    @article = Article.find(params[:id])
    @revision = @article.revisions.last
  end

  def update
    @article = Article.find(params[:id])
    @revision = @article.revisions.create(revision_params)

    if @article.update_attributes(article_params) && @revision.save
      @article.touch
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to collection_path(@article.collection)
  end

  private

  def article_params
    params.require(:article).permit(:title, :summary, :hidden)
  end

  def revision_params
    params[:revision][:user_id] = @current_user.id
    params[:revision][:article_id] = @article.id
    params.require(:revision).permit(:text, :article_id, :user_id)
  end
end
