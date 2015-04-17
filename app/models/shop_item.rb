class ShopItem < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :description, presence: true, length: { maximum: 5000 }
	validates :price, presence: true
	validates :article, presence: true
	validates :count, presence: true
end
