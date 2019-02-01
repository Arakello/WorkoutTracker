class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.date :date
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
