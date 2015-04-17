class Price < ActiveRecord::Base
  validates :cost,  presence: true
  validates :model_id, presence: true
  validates :service_id, presence: true

  belongs_to :model
  belongs_to :service
end
