class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tutorial
  validates :user, presence: true
  validates :rating, presence: true
  validates_uniqueness_of :rating, scope: :user_id


end
