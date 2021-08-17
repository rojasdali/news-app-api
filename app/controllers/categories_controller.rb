class CategoriesController < ApplicationController
  def index
   categories = Category.types

    render json: { data: categories}
  end
end
