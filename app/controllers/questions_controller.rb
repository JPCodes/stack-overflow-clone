class QuestionsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      flash[:notice] = "Edit unsuccessful"
     render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:description)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
