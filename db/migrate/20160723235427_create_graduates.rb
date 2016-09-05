class CreateGraduates < ActiveRecord::Migration[5.0]
  def change
    create_table :graduates do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.integer :grad_year_id

      t.timestamps
    end
  end
end
