class QuestionsController < ApplicationController

	before_action :require_student

    def index
    	@questions = Question.all
    end

	def add
		@question = Question.new
		@examinations = Examination.all
	end

	def edit
		@question = Question.find(params[:id])
		@examinations = Examination.all
	end

	def show
	end

	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			redirect_to '/questions'
		else
			render 'edit'
		end
	end

	#写一个helper_method , 在视图里根据id号查询考试名称

	def save
		#render plain: params[:question].inspect
		@question = Question.new(question_params)
		if @question.save
			redirect_to '/questions'
		else
			render 'add'
		end
	end

	def delete
	end

	private
		def question_params
			params.require(:question).permit(:description, :choices, :answer, :Examination_id)
		end
end
