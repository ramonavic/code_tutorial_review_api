class AddLinkToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :link, :string
  end
end
