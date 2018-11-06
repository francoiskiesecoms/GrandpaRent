class AddPhotoToGrandparent < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :photo, :string
  end
end
