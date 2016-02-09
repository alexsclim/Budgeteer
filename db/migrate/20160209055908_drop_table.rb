class DropTable < ActiveRecord::Migration
  def up
    drop_table :budgets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end