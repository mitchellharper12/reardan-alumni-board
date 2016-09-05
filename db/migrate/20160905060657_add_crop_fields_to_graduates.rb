class AddCropFieldsToGraduates < ActiveRecord::Migration[5.0]
  def change
    add_column :graduates, :x, :integer
    add_column :graduates, :x2, :integer
    add_column :graduates, :y, :integer
    add_column :graduates, :y2, :integer
  end
end
