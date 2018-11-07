class AddCoordinatesToGrandparents < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :latitude, :float
    add_column :grandparents, :longitude, :float
  end
end
