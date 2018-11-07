class AddColumnToGrandparents < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :start_date, :string
    add_column :grandparents, :end_date, :string
  end
end
