class AttachedImage < ActiveRecord::Base
  before_destroy :remove_attachment 
  has_attached_file :image, :convert_options => { :all => "-quality 100" }, :styles => {:gigant => "900x900!", :large => "600x600!", :medium => "300x300!", :thumb => "100x100!" }, :default_url => "logo.png"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

  belongs_to :catalog_item

  private

  def remove_attachment
  	self.image = nil
  	self.save
  end
end
