class Training < ApplicationRecord
  belongs_to :user 
  validates :date, presence: true
  validates_date :date, :between => [Date.today.prev_year(10), Date.today.next_year(10)]
end
