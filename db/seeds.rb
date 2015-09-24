# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#=begin
Question.create(description: "ASP 指的是？", choices: "A Server Page||Active Standard Pages||Active Server Pages||All Standard Pages", answer: "C", Examination_id: 27)
Question.create(description: "包围 ASP 服务器脚本的分隔符是？", choices: "<script>...</script>||<&>...</&>||<%>...</%>||<%...%>", answer: "D", Examination_id: 27)
Question.create(description: "如何用 ASP 写 \"Hello World\" ？", choices: "\"Hello World\"||Response.Write(\"Hello World\")||Document.Write(\"Hello World\")", answer: "B", Examination_id: 27)
Question.create(description: "<%= 等效于：", choices: "<%Write||<%Equal||<%Response.Write||<%Document.Write", answer: "C", Examination_id: 27)
#=end 

#Student.create(stuclass_id: 1, name: "Edwin", password: "4321", password_confirmation: "4321",login_status: 0, last_login_time: Time.now)
#Student.create(stuclass_id: 1, name: "Thomas", password: "4321", password_confirmation: "4321",login_status: 0, last_login_time: Time.now)
#Student.create(stuclass_id: 1, name: "David", password: "4321", password_confirmation: "4321",login_status: 0, last_login_time: Time.now)
#Student.create(stuclass_id: 1, name: "Sam", password: "12345", password_confirmation: "12345",login_status: 0, last_login_time: Time.now)
