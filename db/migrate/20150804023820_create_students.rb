class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.belongs_to :stuclass
      t.string :password
      t.integer :login_status
      t.datetime :last_login_time

      t.timestamps null: false
    end
  end
end
