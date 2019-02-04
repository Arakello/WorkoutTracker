require 'rails_helper'

RSpec.describe Exercise, type: :model do

  context "Can't be empty" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:reps) }
  end
  context "Can't be negative" do
    it { should validate_numericality_of(:reps).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:weight).is_greater_than_or_equal_to(0) }
  end
end
