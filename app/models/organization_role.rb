class OrganizationRole < ActiveRecord::Base
  
  set_table_name "mc_#{RAILS_ENV}" + ".organization_roles"
  belongs_to :organization
  belongs_to :user
  
  validates_presence_of :organization, :user, :name
  
  def to_name
    if self.name == "O"
      return "Owner"
    end
    if self.name == "C"
      return "Collaborator"
    end
    if self.name == "V"
      return "Vendor"
    end
    if self.name == "E"
      return "External Contact"
    end
  end
  
end
