require 'rails_helper'
require 'rails_helper'

RSpec.describe Food, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:region) }
  it { should validate_uniqueness_of(:name) }
end