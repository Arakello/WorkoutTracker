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
  
  context "Username format" do
    it { should allow_values('Abc_22', 'aaa', '21_37', '____', '000' , 'JP2', '_Plato_').for(:username) }
    it { should_not allow_values('example1@gmail.com', '¯\_(ツ)_/¯', "( ͡° ͜ʖ ͡°)", '$eba').for(:username) }
  end
  context "Validate length" do
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
