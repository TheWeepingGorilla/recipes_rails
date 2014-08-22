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
end
