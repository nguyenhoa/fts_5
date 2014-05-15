class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :exam_id

      t.timestamps
    end
  end
end
