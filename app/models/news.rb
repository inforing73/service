class News < ActiveRecord::Base
  validates :title,  presence: true
  validates :description,  presence: true

  has_attached_file :image, :styles => { :large => "900x600!", :medium => "450x300!", :thumb => "150x100!" }, :default_url => "logo.png"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
