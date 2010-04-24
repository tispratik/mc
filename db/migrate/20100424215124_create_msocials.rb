class CreateMsocials < ActiveRecord::Migration
  def self.up
    create_table :msocials do |t|
      t.string :application
      t.string :application_login
      t.string :atoken
      t.string :asecret
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :msocials
  end
end