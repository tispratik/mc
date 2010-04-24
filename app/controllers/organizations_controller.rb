class OrganizationsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /organizations
  # GET /organizations.js
  # GET /organizations.xml
  # GET /organizations.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @organizations }
      format.json  { render :json => @organizations }
    end
  end
  
  # GET /organizations/:id
  # GET /organizations/:id.js
  # GET /organizations/:id.xml
  # GET /organizations/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @organizations }
      format.json  { render :json => @organizations }
    end
  end
  
  # GET /organizations/new
  # GET /organizations/new.js
  # GET /organizations/new.xml
  # GET /organizations/new.json
  def new
    @organization = Organization.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @organization }
      format.json  { render :json => @organization }
    end
  end
  
  # GET /organizations/:id/edit
  def edit
  end
  
  # POST /organizations
  # POST /organizations.js
  # POST /organizations.xml
  # POST /organizations.json
  def create
    @organization = Organization.new(params[:organization])
    
    respond_to do |format|
      if @organization.save
        flash[:notice] = "Organization was successfully created."
        format.html { redirect_to(@organization) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @organization, :status => :created, :location => @organization }
        format.json  { render :json => @organization, :status => :created, :location => @organization }
      else
        flash[:error] = "Organization could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
        format.json  { render :json => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /organizations/:id
  # PUT /organizations/:id.js
  # PUT /organizations/:id.xml
  # PUT /organizations/:id.json
  def update
    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        flash[:notice] = "Organization was successfully updated."
        format.html { redirect_to(@organization) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Organization could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
        format.json  { render :json => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /organizations/:id
  # DELETE /organizations/:id.js
  # DELETE /organizations/:id.xml
  # DELETE /organizations/:id.json
  def destroy
    respond_to do |format|
      if @organization.destroy
        flash[:notice] = "Organization was successfully destroyed."
        format.html { redirect_to(organizations_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Organization could not be destroyed."
        format.html { redirect_to(organization_url(@organization)) }
        format.js   # destroy.js.rjs
        format.xml  { head :unprocessable_entity }
        format.json  { head :unprocessable_entity }
      end
    end
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @collection = @organizations ||= Organization.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @organization ||= Organization.find(params[:id])
    end
    alias :load_resource :resource
    
end