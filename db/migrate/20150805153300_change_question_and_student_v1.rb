class ChangeQuestionAndStudentV1 < ActiveRecord::Migration
  def change
  	change_table :questions do |t|
  		t.rename :title, :description
  	end

  	change_table :students do |t|
  		t.rename :password, :password_digest
  	end
  	
  end
end
