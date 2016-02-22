class Thumbnail < ActiveRecord::Base

belongs_to :movie
mount_uploader :title, TitleUploader
enum status: [:main, :sub]

end
