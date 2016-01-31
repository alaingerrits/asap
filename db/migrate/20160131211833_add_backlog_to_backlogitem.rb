class AddBacklogToBacklogitem < ActiveRecord::Migration
  def change
    add_reference :backlogitems, :backlog, index: true, foreign_key: true
  end
end
