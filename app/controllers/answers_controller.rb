class AnswersController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @question = Question.find(params[:id])
    @answer = @question.answer.new
  end

  def create
    puts "heyheheyheyheyh",current_user
    @user = User.find(current_user.id)
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      flash[:notice] = "Answer not saved"
      redirect_to question_path(@question)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :user_id)
  end
end
