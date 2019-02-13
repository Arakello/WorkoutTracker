class Training < ApplicationRecord
  belongs_to :user 
  has_many :exercises, inverse_of: :training, dependent: :destroy
  accepts_nested_attributes_for :exercises

  validates_presence_of :date
  validates_date :date, :between => [Date.today.prev_year(10), Date.today.next_year(10)]
end
