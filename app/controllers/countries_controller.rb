class CountriesController < ApplicationController
  def index
   country_codes = Country.codes

    render json: { data: country_codes}
  end
end
