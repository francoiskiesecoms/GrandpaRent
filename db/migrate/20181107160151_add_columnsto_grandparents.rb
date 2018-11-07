class AddColumnstoGrandparents < ActiveRecord::Migration[5.2]
  def change
    add_column :grandparents, :start_date, :datetime
    add_column :grandparents, :end_date, :datetime
  end
end
