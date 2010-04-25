class Organization < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_user_id"
  has_one :mcontact
  has_many :teams
  
  def before_validation_on_create
    self.permalink = Authlogic::Random.friendly_token
  end
  
  def to_s
    name
  end
  
  def to_param
    UrlStore.encode(permalink)
  end
end