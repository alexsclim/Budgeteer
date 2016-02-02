class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.date :year
      t.date :month
      t.decimal :income
      t.decimal :food
      t.decimal :entertainment
      t.decimal :telephone
      t.decimal :rent
      t.decimal :transportation
      t.decimal :clothing
      t.decimal :other
      t.decimal :total_budget

      t.timestamps null: false
    end
    add_index :budgets, [:user_id, :created_at]
  end
end
