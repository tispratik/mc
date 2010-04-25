# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100424215138) do

  create_table "accesses", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.string   "role"
    t.integer  "reports_to_user_id"
    t.integer  "ext_organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mcontacts", :force => true do |t|
    t.string   "email"
    t.string   "country_id"
    t.string   "state"
    t.string   "city"
    t.string   "street1"
    t.string   "street2"
    t.string   "zip"
    t.string   "telnum1"
    t.integer  "telnum1_type"
    t.string   "telnum2"
    t.integer  "telnum2_type"
    t.string   "webpage1"
    t.integer  "webpage1_type"
    t.string   "webpage2"
    t.integer  "webpage2_type"
    t.string   "short_description"
    t.boolean  "is_email_verified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "msocials", :force => true do |t|
    t.string   "application"
    t.string   "application_login"
    t.string   "atoken"
    t.string   "asecret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "owner_user_id"
    t.string   "industry"
    t.string   "specific_industry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_users", :force => true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.integer  "owner_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
