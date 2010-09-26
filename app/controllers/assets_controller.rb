class AssetsController < ApplicationController
  
  before_filter :login_required
  before_filter :find_organization
  before_filter :find_asset, :except => [:index, :new, :create]
  before_filter :check_organization_membership
  before_filter :check_organization_ownership, :only => [:destroy]
  
  def index
    @asset = Asset.new
    @assets = eval(get_query)
  end
  
  def destroy
    @asset.destroy
    flash[:notice] = "File deleted."
    redirect_to :back
  end
  
  def show
    send_file @asset.data.path(params[:style]), :type => @asset.data_content_type, :disposition => 'inline'
  end
  
  def create
    @asset = @organization.assets.build(params[:asset][:assets])
    #alias field is non mandatory
    
    if @asset.save
      flash[:notice] = 'File uploaded successfully.'
      redirect_to :back
    else
      flash[:notice] = 'Failed to upload file.'
      flash[:errors] = @asset.errors.full_messages.join('<br />')
      redirect_to :back
    end
  end
  
  private
  
  def find_asset
    @asset = @organization.assets.find(params[:id])
  end
  
  def get_query
    qry = "@organization.assets"
    qry = qry + sort_order('descend_by_created_at') 
    #qry = qry + ".all(:include => {:modul => [:creator, :updator, :parent]})"
    qry = qry + ".paginate(:page => #{params[:page] || 1}, :per_page => 15)"
  end
end
