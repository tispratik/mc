class Organization < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_user_id"
end