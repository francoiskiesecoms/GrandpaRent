class CreateGrandparents < ActiveRecord::Migration[5.2]
  def change
    create_table :grandparents do |t|
      t.string :name
      t.integer :age
      t.string :address
      t.string :speciality
      t.references :user, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
