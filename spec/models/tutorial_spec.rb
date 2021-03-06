require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'validations' do
    it { should accept_nested_attributes_for :videos }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:thumbnail) }
  end

  describe 'relationships' do
    it { should have_many :videos }
    it { should have_many :taggings }
  end
end
