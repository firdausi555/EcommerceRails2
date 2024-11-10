class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  searchkick callbacks: :async

  def search_data
    {
    name: name,
    description: description,
    price: price,
    discount: discount

  }
  end
end
