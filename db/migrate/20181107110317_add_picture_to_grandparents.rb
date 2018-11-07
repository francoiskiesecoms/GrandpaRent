class AddPictureToGrandparents < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :picture, :string
  end
end
