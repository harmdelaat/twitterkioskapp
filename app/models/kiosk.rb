class Kiosk < ActiveRecord::Base
  belongs_to :user
  has_many :fxs
  has_attached_file :background, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
end
