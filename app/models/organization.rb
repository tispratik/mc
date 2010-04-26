class Organization < ActiveRecord::Base

  STATUSES = Decode.find_all_by_name("MC_Org_Status")
  
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_user_id"
  has_one :mcontact
  has_many :teams
  has_many :organization_roles
  has_many :users, :through => :organization_roles
  alias :roles :organization_roles
  
  def before_validation_on_create
    self.hashkey = Authlogic::Random.friendly_token
  end
  
  def to_s
    name
  end
  
  def to_param
    UrlStore.encode(hashkey)
  end
  
  def after_create
    #Make owner of organization when created
    roles.create(:user => owner, :name => 'O')
  end
end