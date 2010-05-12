class User < ActiveRecord::Base
  
  establish_connection "va_#{RAILS_ENV}"
  
  has_one :usr
  has_one :ucontact
  has_many :teams
  
  acts_as_authentic do |a|
    a.logged_in_timeout = 100.minutes # default is 10.minutes
    a.validates_format_of_login_field_options :with => /^\w+$/, :message =>"only numbers, letters and underscore allowed"
  end
  
  def self.find_by_username_or_login_email(login)
    find_by_username(login) || find_by_login_email(login)
  end
  
  def to_param
    username
  end
  
  def to_s
    [usr.first_name, usr.last_name].join(' ')
  end
  
  def self.curr_user
    Thread.current[:curr_user]
  end
  
  def self.curr_user=(user)
    #Setting the user to nil on logout
    #    raise(ArgumentError,
    #      "Invalid user. Expected an object of class 'User', got #{user.inspect}") unless user.is_a?(User)
    Thread.current[:curr_user] = user
  end
  
  def my_organizations_with_roles
    # Organization.all(:joins => "left join organization_invitations on organization_invitations.organization_id=organization.id",
    #   :conditions => ["organizations.user_id = ? or (organization_invitations.user_id = ? and organization_invitations.confirmed=1)", id, id],
    #   :group => "organizations.id"
    # )
    OrganizationRole.all(:conditions => {:user_id => id}, :include => :organization)
  end
  
  def self.cid
    curr_user.id
  end
  
end