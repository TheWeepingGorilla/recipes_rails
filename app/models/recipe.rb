class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :instructions, :presence => true
  validates :date, :presence => true
  validates_numericality_of :rating, less_than: 6, greater_than: 0, allow_blank: true

  has_and_belongs_to_many :tags

  default_scope {order('rating DESC')}

  def self.sort_by_freshness
    recipes = []
    Recipe.all.each do |recipe|
      rating = recipe.rating
      age = Date.today - recipe.date
      priority = (rating.to_i * 10) - age.to_i
      recipes << Hash[id: recipe.id, name: recipe.name, priority: priority]
    end
    recipes.sort_by! { |recipe| recipe[:priority] }
  end
end
