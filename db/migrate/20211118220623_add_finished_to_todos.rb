class AddFinishedToTodos < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :finished, :boolean
  end
end
