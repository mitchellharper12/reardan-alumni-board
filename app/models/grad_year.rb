class GradYear < ApplicationRecord
  has_and_belongs_to_many :photos
  has_many :graduates
  validates :year, numericality: {greater_than: 1900, less_than: 2200}

  def photo
    raise "A grad year should have exactly one photo" if photos.count != 1
    photos.first
  end
end
