class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.string :title
      t.datetime :exam_time
      t.integer :duration
      t.integer :level

      t.timestamps null: false
    end
  end
end
