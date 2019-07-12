class Order < ApplicationRecord
  has_many :carted_products
  belongs_to :user
  has_many :products, through: :carted_products
end
