class Thumbnail < ActiveRecord::Base

belongs_to :movie
#accepts_nested_attributes_for :movie
#mount_uploader :thumbnail, ThumbnailUploader
enum thumbmail: [:main, :sub1, :sub2, :sub3]

end
