class Training < ApplicationRecord
  belongs_to :user 
  has_many :exercises, dependent: :destroy
  validates_presence_of :date
  validates_date :date, :between => [Date.today.prev_year(10), Date.today.next_year(10)]
end
