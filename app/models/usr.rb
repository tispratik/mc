class Usr < ActiveRecord::Base
  establish_connection :op
  belongs_to :user
end