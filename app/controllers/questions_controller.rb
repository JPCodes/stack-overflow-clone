class QuestionsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update, :destroy]

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = @user.questions.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def question_params
    params.require(:question).permit(:description)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
