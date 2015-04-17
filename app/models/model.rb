class Model < ActiveRecord::Base
  validates :title,  presence: true

  belongs_to :item
  has_many :prices, dependent: :destroy
  has_many :services, through: :prices
  
end
