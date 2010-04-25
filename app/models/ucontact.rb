class Ucontact < ActiveRecord::Base
  establish_connection "op_#{RAILS_ENV}"
  belongs_to :user
end