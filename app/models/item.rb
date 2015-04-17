class Item < ActiveRecord::Base
  validates :title,  presence: true
  
  
  belongs_to :repair
  has_many :models, dependent: :destroy
  has_many :services, -> { distinct } , through: :models
  
end
