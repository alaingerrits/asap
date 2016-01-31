class Backlog < ActiveRecord::Base
  belongs_to :team
  has_many :backlogitems
end
