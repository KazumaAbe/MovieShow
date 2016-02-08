class Thumbnail < ActiveRecord::Base

belongs_to :movie
mount_uploader :thumbnail, ThumbnailUploader
enum status: %i(main sub)

end
