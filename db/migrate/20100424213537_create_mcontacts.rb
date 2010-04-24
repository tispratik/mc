class CreateMcontacts < ActiveRecord::Migration
  def self.up
    create_table :mcontacts do |t|
      t.string :email
      t.string :country_id
      t.string :state
      t.string :city
      t.string :street1
      t.string :street2
      t.string :zip
      t.string :telnum1
      t.integer :telnum1_type
      t.string :telnum2
      t.integer :telnum2_type
      t.string :webpage1
      t.integer :webpage1_type
      t.string :webpage2
      t.integer :webpage2_type
      t.string :short_description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :mcontacts
  end
end