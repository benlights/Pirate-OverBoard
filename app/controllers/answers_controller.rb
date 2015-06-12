class AnswersController < ApplicationController
  def new
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = @question.answers.build(answers_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end


  private

  def answers_params
    params.require(:answer).permit(:body, :user_id)
  end
end