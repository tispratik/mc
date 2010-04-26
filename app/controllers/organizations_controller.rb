class OrganizationsController < ApplicationController
  
  before_filter :login_required
  before_filter :find_organization, :only => [:show, :edit, :update, :destroy]
  before_filter :check_organization_membership, :only => [:show]
  before_filter :check_organization_ownership, :only => [:edit, :update, :destroy]
  
  def index
    opts = {}
    opts[:order] = params[:order_by] if params[:order_by]
    
    @organizations = current_user.organizations.paginate(opts.merge(:page => params[:page] || 1, :per_page => 10))
  end
  
  def show
  end
  
  def new
    @organization = current_user.organizations.new
  end
  
  def create
    @organization = Organization.new(params[:organization])
    
    if @organization.save
      flash[:notice] = 'Organization was successfully created.'
      redirect_to @organization
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @organization.update_attributes(params[:organization])
      flash[:notice] = 'Organization was successfully updated.'
      redirect_to @organization
    else
      render :edit
    end
  end
  
  def destroy
    @organization.destroy
    flash[:notice] = 'Organization was successfully removed.'
    redirect_to organizations_path
  end
  
  private
  
  def find_organization
    params[:organization_id] = params[:id]
    super
  end
  
end