class ExaminationsController < ApplicationController

	before_action :require_student

	helper_method :exam_status, :split_choices

	def index
		@examinations = Examination.all
	end

	def add
        @examination = Examination.new
	end

	def show
		@examination = Examination.find(params[:id])
		session[:exam_id] = params[:id]
		@rand_questions_id = @examination.questions.pluck(:id).sample(3)
		@rand_questions = Question.where(id: @rand_questions_id)
	end

	def split_choices(choices)
		return choices.split("\r\n")
	end

	def create
		@examination = Examination.new(examination_params)
		if @examination.save
			redirect_to '/exam'
		else
			render 'add'
		end
	end

	def submit #交卷
		#render plain: params[:qc].inspect
		@student_id = session[:student_id]    #学生id
		@examination_id = session[:exam_id]   #考试id
		@exam_level =Examination.find(@examination_id).level

        @exam_log_new = ExamLog.new do |e|
        	e.Student_id = @student_id
        	e.Examination_id = @examination_id
        	e.exam_level = @exam_level
        	e.score = 0
        	e.save
        end

        @exam_log_id = ExamLog.last.id   #同一份考试的多次记录的id号
		@submit_answers = params[:qc]    #提交的参数
		@score = 0                       #总分初始化

        @submit_answers.each do |s|
        	@question_id = params['question_id_' + s.first]   #这里还需要过滤一下s.first
        	@student_answer = StuAnswer.new do |sa|
        		sa.Student_id = session[:student_id]
        		sa.Question_id = @question_id
        		sa.ExamLog_id = @exam_log_id
        		sa.stu_choices = s.last
        		sa.save
        	end
        	@correct_answer = Question.find(@question_id)
        	if s.last == @correct_answer.answer  #算出总分
        		@score += 1
        	end
        end

        @exam_log_update = ExamLog.find(@exam_log_id)
        @exam_log_update.update(score: @score)
	end


	def destroy
		@examination = Examination.find(params[:id])
		@examination.destroy

		redirect_to '/exam'
	end 


	def exam_status(num)
		if num==0
			return '关闭'
		elsif num==1
			return '模拟考试'
		else
			return '正式考试'
		end
	end

    private
	    def examination_params
	    	params.require(:examination).permit(:title, :exam_time, :duration, :level)
	    end
end
