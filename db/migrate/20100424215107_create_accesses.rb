class CreateAccesses < ActiveRecord::Migration
  def self.up
    create_table :accesses do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :role
      t.integer :reports_to_user_id
      t.integer :ext_organization_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :accesses
  end
end