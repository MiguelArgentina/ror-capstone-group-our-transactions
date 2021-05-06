class ChangeUserTableColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :email, :icon
  end
end
