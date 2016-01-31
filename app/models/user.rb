class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :set_user_on_team

  private

    def set_user_on_team
      # create a team for the new user (where team name is user email)
      @team = Team.create(:name => email)
      # store the team id in the user object
      self.team_id = @team.id
      self.save
    end

end
