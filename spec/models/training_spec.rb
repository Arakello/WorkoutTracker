require 'rails_helper'

RSpec.describe Training, type: :model do
   it { should validate_presence_of(:date) }
   it { should validate_presence_of(:user_id) }

   context 'date' do
     let(:training) { build :training }
     it 'is valid when in timeframe' do
       expect(training).to be_valid
     end
     it 'is invalid when too long ago' do
       training.date = Date.today.prev_year(20)
       expect(training).not_to be_valid
     end
     it 'is invalid when too far into the future' do
       training.date = Date.today.next_year(20)
       expect(training).not_to be_valid
     end
   end
end
