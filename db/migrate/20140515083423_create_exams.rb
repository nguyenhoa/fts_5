class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :subject_id
      t.integer :total_question
      t.time :time_limit

      t.timestamps
    end
  end
end
