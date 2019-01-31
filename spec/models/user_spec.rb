require 'rails_helper'

RSpec.describe User, type: :model do
  context "Is present" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
  context "Is unique" do
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it { should validate_length_of(:password).is_at_least(6) }
end
