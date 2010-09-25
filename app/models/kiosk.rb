class Kiosk < ActiveRecord::Base
  belongs_to :user
  has_many :fxs
  has_attached_file :background, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name
  validates_attachment_size(:background, :less_than => 1.megabyte, :unless => "background_content_type.blank?")
end
