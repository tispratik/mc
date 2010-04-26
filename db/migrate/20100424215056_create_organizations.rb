class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.integer :status
      t.integer :owner_user_id
      t.string :industry
      t.string :specific_industry
      t.string :hashkey
      t.boolean :use_ssl
      t.timestamps
    end
    
    add_index 'organizations', 'owner_user_id'
    
  end
  
  def self.down
    drop_table :organizations
  end
end