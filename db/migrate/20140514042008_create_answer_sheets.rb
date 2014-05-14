class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :examination_id
      t.integer :question_id
      t.integer :option_id

      t.timestamps
    end
  end
end
