class Graduate < ApplicationRecord
  validates_presence_of :firstname, :lastname, :grad_year_id, :x, :x2, :y, :y2
end
