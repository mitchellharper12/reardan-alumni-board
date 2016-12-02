class AddJoinTableGradYearsPhotos < ActiveRecord::Migration[5.0]
  def change
    create_join_table :grad_years, :photos
  end
end
