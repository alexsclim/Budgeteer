class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :spent_balance
      t.decimal :allocated_balance
      t.date :start_date
      t.date :end_date
      t.decimal :spent_food
      t.decimal :spent_housing
      t.decimal :spent_utilities
      t.decimal :spent_transportation
      t.decimal :spent_health
      t.decimal :spent_clothing
      t.decimal :spent_education
      t.decimal :spent_fitness
      t.decimal :spent_electronics
      t.decimal :spent_other
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
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :budgets, [:user_id, :created_at]
  end
end
