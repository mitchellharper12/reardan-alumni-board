class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filepath
      t.string :resolution
      t.integer :grad_year_id

      t.timestamps null: false
    end
  end
end
