class Movie < ActiveRecord::Base

  belongs_to :user
  has_many :thumbnails

  accepts_nested_attributes_for :thumbnails, reject_if: :reject_thumbnails

  def reject_thumbnails(attributes)
    attributes['title'].blank?
  end

end
