class Exercise < ApplicationRecord
  belongs_to :training
  validates_presence_of :name
  validates_presence_of :reps
  validates_numericality_of :reps, greater_than_or_equal_to: 0  
  validates_numericality_of :weight, greater_than_or_equal_to: 0 
end
