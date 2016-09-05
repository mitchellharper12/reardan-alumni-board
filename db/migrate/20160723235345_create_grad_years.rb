class CreateGradYears < ActiveRecord::Migration[5.0]
  def change
    create_table :grad_years do |t|
      t.integer :year

      t.timestamps
    end
  end
end
