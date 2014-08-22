class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :instructions, :presence => true
  validates :date, :presence => true
  validates_numericality_of :rating, less_than: 6, greater_than: 0
end
