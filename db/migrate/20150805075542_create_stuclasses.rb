class CreateStuclasses < ActiveRecord::Migration
  def change
    create_table :stuclasses do |t|
      t.string :name
      t.string :grade
      
      t.timestamps null: false
    end
  end
end
