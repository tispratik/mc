class McontactsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /mcontacts
  # GET /mcontacts.js
  # GET /mcontacts.xml
  # GET /mcontacts.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @mcontacts }
      format.json  { render :json => @mcontacts }
    end
  end
  
  # GET /mcontacts/:id
  # GET /mcontacts/:id.js
  # GET /mcontacts/:id.xml
  # GET /mcontacts/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @mcontacts }
      format.json  { render :json => @mcontacts }
    end
  end
  
  # GET /mcontacts/new
  # GET /mcontacts/new.js
  # GET /mcontacts/new.xml
  # GET /mcontacts/new.json
  def new
    @mcontact = Mcontact.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @mcontact }
      format.json  { render :json => @mcontact }
    end
  end
  
  # GET /mcontacts/:id/edit
  def edit
  end
  
  # POST /mcontacts
  # POST /mcontacts.js
  # POST /mcontacts.xml
  # POST /mcontacts.json
  def create
    @mcontact = Mcontact.new(params[:mcontact])
    
    respond_to do |format|
      if @mcontact.save
        flash[:notice] = "Mcontact was successfully created."
        format.html { redirect_to(@mcontact) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @mcontact, :status => :created, :location => @mcontact }
        format.json  { render :json => @mcontact, :status => :created, :location => @mcontact }
      else
        flash[:error] = "Mcontact could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @mcontact.errors, :status => :unprocessable_entity }
        format.json  { render :json => @mcontact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /mcontacts/:id
  # PUT /mcontacts/:id.js
  # PUT /mcontacts/:id.xml
  # PUT /mcontacts/:id.json
  def update
    respond_to do |format|
      if @mcontact.update_attributes(params[:mcontact])
        flash[:notice] = "Mcontact was successfully updated."
        format.html { redirect_to(@mcontact) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Mcontact could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @mcontact.errors, :status => :unprocessable_entity }
        format.json  { render :json => @mcontact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /mcontacts/:id
  # DELETE /mcontacts/:id.js
  # DELETE /mcontacts/:id.xml
  # DELETE /mcontacts/:id.json
  def destroy
    respond_to do |format|
      if @mcontact.destroy
        flash[:notice] = "Mcontact was successfully destroyed."
        format.html { redirect_to(mcontacts_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Mcontact could not be destroyed."
        format.html { redirect_to(mcontact_url(@mcontact)) }
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
      @collection = @mcontacts ||= Mcontact.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @mcontact ||= Mcontact.find(params[:id])
    end
    alias :load_resource :resource
    
end