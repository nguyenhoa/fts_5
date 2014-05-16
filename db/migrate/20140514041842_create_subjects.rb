class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.integer :total_question
      t.integer :time_limit

      t.timestamps
    end
  end
end
