class NewsController < ApplicationController
  def latest
    @articles = EditorialEngine::Article.latest
  end

  def detail
    @article = EditorialEngine::Article.find(params[:article_id])
  end
end
