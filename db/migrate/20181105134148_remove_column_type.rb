class RemoveColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :grandparents, :type
  end
end
