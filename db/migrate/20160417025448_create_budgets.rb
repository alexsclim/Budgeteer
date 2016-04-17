class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :title
      t.decimal :balance
      t.decimal :allocated_balance
      t.date :start_date
      t.date :end_date
      t.decimal :food
      t.decimal :housing
      t.decimal :utilities
      t.decimal :transportation
      t.decimal :health
      t.decimal :clothing
      t.decimal :education
      t.decimal :fitness
      t.decimal :electronics
      t.decimal :other
      t.decimal :allocated_food
      t.decimal :allocated_housing
      t.decimal :allocated_utilities
      t.decimal :allocated_transportation
      t.decimal :allocated_health
      t.decimal :allocated_clothing
      t.decimal :allocated_education
      t.decimal :allocated_fitness
      t.decimal :allocated_electronics
      t.decimal :allocated_other
      t.timestamps null: false
    end
  end
end
