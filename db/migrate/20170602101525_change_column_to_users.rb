class ChangeColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :name, :string
  end
end
