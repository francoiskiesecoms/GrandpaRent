class AddDescriptionToGrandparent < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :description, :text
  end
end
