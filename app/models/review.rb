class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :tutorial
  validates :user, presence: true
  validates :rating, presence: true
  

end
