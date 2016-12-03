class Graduate < ApplicationRecord
  belongs_to :grad_year
  validates_presence_of :firstname, :lastname, :grad_year_id, :x, :x2, :y, :y2
  delegate :year, to: :grad_year
end
