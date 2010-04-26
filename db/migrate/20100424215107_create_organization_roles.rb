class CreateOrganizationRoles < ActiveRecord::Migration
  def self.up
    create_table :organization_roles do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :name
      t.integer :reports_to_user_id
      t.integer :ext_organization_id
    end
    
    add_index 'organization_roles', 'organization_id'
    add_index 'organization_roles', 'user_id'
    add_index 'organization_roles', 'reports_to_user_id'
    add_index 'organization_roles', 'ext_organization_id'
    
  end
  
  def self.down
    drop_table :organization_roles
  end
end