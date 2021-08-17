class ArticlesController < ApplicationController
  def index
    p params
    articles = ArticlesService.fetch_articles(params)

    render json: { data: articles}
  end
end
