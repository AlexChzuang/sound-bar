class Episode < ApplicationRecord
  belongs_to :podcast
  has_many :comments

  validates :title, presence: true

  mount_uploader :recording, RecordingUploader
  mount_uploader :cover, CoverUploader

  include Randomable

end
