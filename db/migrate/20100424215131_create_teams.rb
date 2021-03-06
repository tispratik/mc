class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :organization_id
      t.integer :owner_user_id
      
      t.timestamps
    end
    
    add_index 'teams', 'organization_id'
    add_index 'teams', 'owner_user_id'
    
  end
  
  def self.down
    drop_table :teams
  end
end