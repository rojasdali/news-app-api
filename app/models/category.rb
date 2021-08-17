class Category
  include ActiveModel::Model

  attr_accessor :types

  def self.types
    [
      "General",
      "Business",
      "Entertainment",
      "Health",
      "Science",
      "Sports",
      "Technology"
    ]
  end
end