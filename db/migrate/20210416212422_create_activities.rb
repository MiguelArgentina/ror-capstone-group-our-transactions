class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :author_id
      t.integer :group_id
      t.float :amount

      t.timestamps
    end
  end
end
