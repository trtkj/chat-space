class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|

      t.reference :group, index: true, null: false
      t.reference :user, index: true, null: false
      t.timestamps
    end
  end
end
