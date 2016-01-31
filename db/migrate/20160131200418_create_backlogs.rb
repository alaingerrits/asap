class CreateBacklogs < ActiveRecord::Migration
  def change
    create_table :backlogs do |t|
      t.string :description
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
