class Team < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_user_id"
  belongs_to :organization
  belongs_to :user
end