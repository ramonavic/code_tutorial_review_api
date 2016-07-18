class AddTutorialReferenceToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :tutorial, index: true, foreign_key: true
  end
end
