class CatalogCategory < ActiveRecord::Base

	has_attached_file :image, :styles => { :large => "600x600!", :medium => "300x300!", :thumb => "100x100!" }, :default_url => "logo.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  validates :title,  presence: true
  validates :description,  presence: true

  has_many :catalog_items
end
