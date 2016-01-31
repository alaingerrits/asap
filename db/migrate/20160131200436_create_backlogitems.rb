class CreateBacklogitems < ActiveRecord::Migration
  def change
    create_table :backlogitems do |t|
      t.string :name
      t.string :description
      t.integer :size
      t.date :targetdate

      t.timestamps null: false
    end
  end
end
