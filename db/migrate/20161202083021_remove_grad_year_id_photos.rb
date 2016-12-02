class RemoveGradYearIdPhotos < ActiveRecord::Migration[5.0]
  def change
   remove_column :photos, :grad_year_id
  end
end
