class Organization < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_user_id"
  has_one :mcontact
  has_many :teams
end