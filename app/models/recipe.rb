class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :instructions, :presence => true
  validates :date, :presence => true
  validates_numericality_of :rating, less_than: 6, greater_than: 0, allow_blank: true

  has_and_belongs_to_many :tags

  default_scope {order('rating DESC')}
end
