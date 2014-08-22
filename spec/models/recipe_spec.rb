require 'rails_helper'

describe Recipe do
  it { should validate_presence_of :name }
  it { should validate_presence_of :instructions }
  it { should validate_presence_of :date }
  it do
    should validate_numericality_of(:rating).
    is_less_than(6).
    is_greater_than(0)
  end
  it "has and belongs to many tags" do
    new_recipe = Recipe.create(:name => "Ramen", :instructions => "Boil water", :date => "2014-06-19")
    tag1 = Tag.create(:name => "Casual Dining")
    tag2 = Tag.create(:name => "Do Not Serve, Ever")
    new_recipe.tags << tag1
    new_recipe.tags << tag2
    expect(new_recipe.tags).to eq [tag1, tag2]
  end
end

