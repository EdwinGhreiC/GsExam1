class CreateStuAnswers < ActiveRecord::Migration
  def change
    create_table :stu_answers do |t|
      t.references :Student
      t.references :Question
      t.references :ExamLog
      t.string :stu_choices

      t.timestamps null: false
    end
  end
end
