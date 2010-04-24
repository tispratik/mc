class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.integer :owner_user_id
      t.string :industry
      t.string :specific_industry
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :organizations
  end
end