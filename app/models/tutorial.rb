class Tutorial < ActiveRecord::Base
  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :link, presence: true

  belongs_to :user
  has_many :reviews
end
