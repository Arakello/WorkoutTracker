class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.integer :reps
      t.integer :weight
      t.belongs_to :training, index: true
      t.timestamps
    end
  end
end
