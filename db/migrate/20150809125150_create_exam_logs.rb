class CreateExamLogs < ActiveRecord::Migration
  def change
    create_table :exam_logs do |t|
      t.references :Student
      t.references :Examination
      t.integer :exam_level
      t.float :score

      t.timestamps null: false
    end
  end
end
