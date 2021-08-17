require 'open-uri'

class ArticlesService
  CREDENTIALS = Rails.application.credentials[Rails.env.to_sym]
  NEWS_API_URL = CREDENTIALS[:news_api_url]
  NEWS_API_KEY = CREDENTIALS[:news_api_key]
  
  class << self
    def fetch_articles params
      country_string = params[:country] ? "country=#{params[:country]}&" : "" # expecting FE to send default country GB
      query_string = "#{params[:query] ? "q=#{params[:query]}&" : ""}"
      category_string = "#{params[:category] ? "category=#{params[:category]}&" : ""}"

      url = "#{NEWS_API_URL}/top-headlines?"\
      "#{country_string}"\
      "#{query_string}"\
      "#{category_string}"\
      "page=#{params[:page]}&"\
      "pageSize=#{params[:perPage]}&"\
      "apiKey=#{NEWS_API_KEY}"

      begin
        req = open(url)

        response_body = req.read

        JSON.parse(response_body)
      rescue
        { error: "Error fetching data" }
      end
    end
  end
end
