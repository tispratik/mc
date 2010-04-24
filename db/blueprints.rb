require 'machinist/active_record'
require 'random_data'
require 'faker'
require 'sham'
require 'time_extensions'

countries = Country.all.map(&:ison)
a_phone_type = Decode.all_values_by_decode_name("OP_Phone_Type")
a_org_status = Decode.all_values_by_decode_name("MC_Org_Status")
a_web_page_type = Decode.all_values_by_decode_name("OP_Website_Type")

Mcontact.blueprint do
  city          { Random.city }
  state         { "US.#{Random.state}" }
  country_id    { countries.rand }
  street1       { Random.address_line_1 }
  street2       { Random.address_line_2 }
  zip           { Random.zipcode }
  state         { "US.#{Random.state}" }
  telnum1       { Random.international_phone }
  telnum2       { Random.international_phone }
  telnum1_type  { a_phone_type.rand }
  telnum2_type  { a_phone_type.rand }
  is_telnum1_public { Random.boolean }
  is_telnum2_public { Random.boolean }
  email          { Random.email }
  webpage1       { 'http://' + Faker::Internet.domain_name }
  webpage2       { 'http://' + Faker::Internet.domain_name }
  webpage3       { 'http://' + Faker::Internet.domain_name }
  webpage1_type  { a_personal_web_page_type.rand }
  webpage2_type  { a_personal_web_page_type.rand }
  webpage3_type  { a_personal_web_page_type.rand }
  short_bio      { Populator.words(10..50) }
  time_zone      { Time.random.zone }
  is_address_public   { Random.boolean }
  is_email_verified   { Random.boolean }
end

Organization.blueprint do
  name                { ["Viridian", "Google", "Reliance", "eBay", "Walmart", "Tata Motors", "TCS", "Infosys", "DataCops"].rand }
  industry            { ["Engineering", "IT", "Mechanical", "BPO"].rand }
  specific_industry   { ["Mining", "Search Engine Optimization", "Automobile", "Knowledge Management"].rand }
end

Access.blueprint do
  role      { ["O", "C", "V", "E"].rand }
end

Msocial.blueprint do
  application { ["Facebook", "Twitter", "Orkut", "MySpace"].rand}
  application_login { Faker::Name.first_name }
  atoken { Random.alphanumeric }
  asecret { Random.alphanumeric }
end

Team.blueprint do
  name { Faker::Company.name }
end