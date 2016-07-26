class Tutorial < ActiveRecord::Base
  validates_presence_of :user, :title, :link, :description

  belongs_to :user
  has_many :reviews

  accepts_nested_attributes_for :reviews, :user
end
