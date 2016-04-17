class BudgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @budgets = Budget.all
    @user = current_user
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = current_user.budgets.build(budget_params)
    if @budget.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @budget = Budget.find(params[:id])
  end

  private

  def budget_params
    params.require(:budget).permit(:allocated_food, :allocated_housing, :allocated_utilities,
                                   :allocated_transportation, :allocated_health, :allocated_clothing,
                                   :allocated_education, :allocated_fitness, :allocated_electronics,
                                   :allocated_other, :food, :housing, :utilities, :transportation,
                                   :health, :clothing, :education, :fitness, :electronics, :other, :start_date,
                                   :end_date)
  end

end

