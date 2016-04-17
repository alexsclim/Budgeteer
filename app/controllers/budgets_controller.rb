class BudgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @budgets = current_user.budgets.all
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

  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update_attributes(budget_params)
      redirect_to budget_path(@budget)
    else
      render 'edit'
    end
  end

  def destroy
    Budget.find(params[:id]).destroy
    flash[:success] = 'Budget deleted'
    redirect_to root_path
  end

  private

  def budget_params
    params.require(:budget).permit(:allocated_food, :allocated_housing, :allocated_utilities,
                                   :allocated_transportation, :allocated_health, :allocated_clothing,
                                   :allocated_education, :allocated_fitness, :allocated_electronics,
                                   :allocated_other, :spent_food, :spent_housing, :spent_utilities, :spent_transportation,
                                   :spent_health, :spent_clothing, :spent_education, :spent_fitness, :spent_electronics, :spent_other, :start_date,
                                   :end_date)
  end

end

