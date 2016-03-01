class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie, counter_cache: true

  validates :text, presence: true

end
