class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.integer :user_id
      t.text :content
      t.boolean :is_done, default: false

      t.timestamps
    end
  end
end
