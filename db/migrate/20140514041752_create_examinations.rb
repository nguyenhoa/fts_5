class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :sum_correct
      t.integer :status

      t.timestamps
    end
  end
end
