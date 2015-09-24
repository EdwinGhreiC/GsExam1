class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :choices
      t.string :answer
      t.references :Examination

      t.timestamps null: false
    end

  end
end
