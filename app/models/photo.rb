class Photo < ActiveRecord::Base
  belongs_to :grad_year
  has_many :image_areas
  delegate :year, to: :grad_year

  has_attached_file :image, styles: { thumb: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :grad_year_id
  validates_uniqueness_of :grad_year_id
end
