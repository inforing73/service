class Service < ActiveRecord::Base
  validates :title,  presence: true

  has_many :prices, dependent: :destroy
  has_many :models, through: :prices
end
