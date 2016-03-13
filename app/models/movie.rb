class Movie < ActiveRecord::Base

  belongs_to :user
  has_many :thumbnails, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :thumbnails, reject_if: :reject_thumbnails

  validates :title, :copy, :concept, presence: true

  def reject_thumbnails(attributes)
    attributes['title'].blank?
  end

end
