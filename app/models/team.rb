class Team < ActiveRecord::Base
  has_many :backlogs  
  after_create :create_backlog_for_team

  private

    def create_backlog_for_team
      Backlog.create(:description => "Backlog for #{name}", :team_id => id)
    end

end
