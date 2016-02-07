class Movie < ActiveRecord::Base

  belongs_to :user
  has_many :thumbnails

  #accepts_nested_attributes_for :thumbnails

end
