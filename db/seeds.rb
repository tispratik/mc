require File.expand_path(File.dirname(__FILE__) + '/blueprints')

[Mcontact, Organization, Access, Msocial, Team, TeamUser].each(&:delete_all)

all_users = User.all

p "Making Organizations"
10.times do
  u = Organization.make(:mcontact => Mcontact.make, :owner => all_users.rand)
  5.times do
    random_user = all_users.rand
    t = Team.make(:organization => u, :owner => random_user)
    TeamUser.make(:user => random_user, :team => t)
    
    10.times do
      TeamUser.make(:user => all_users.rand, :team => t)
    end
  end
end