class Photo < ActiveRecord::Base
  has_and_belongs_to_many :grad_years
  has_many :image_areas

  has_attached_file :image, styles: { thumb: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def years_string
    grad_years.collect(&:year).join(", ")
  end

  def grad_year
    raise "Invalid attempt to query grad year for photo" if grad_years.count > 1
    grad_years.first
  end
end
