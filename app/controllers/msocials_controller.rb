class MsocialsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /msocials
  # GET /msocials.js
  # GET /msocials.xml
  # GET /msocials.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @msocials }
      format.json  { render :json => @msocials }
    end
  end
  
  # GET /msocials/:id
  # GET /msocials/:id.js
  # GET /msocials/:id.xml
  # GET /msocials/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @msocials }
      format.json  { render :json => @msocials }
    end
  end
  
  # GET /msocials/new
  # GET /msocials/new.js
  # GET /msocials/new.xml
  # GET /msocials/new.json
  def new
    @msocial = Msocial.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @msocial }
      format.json  { render :json => @msocial }
    end
  end
  
  # GET /msocials/:id/edit
  def edit
  end
  
  # POST /msocials
  # POST /msocials.js
  # POST /msocials.xml
  # POST /msocials.json
  def create
    @msocial = Msocial.new(params[:msocial])
    
    respond_to do |format|
      if @msocial.save
        flash[:notice] = "Msocial was successfully created."
        format.html { redirect_to(@msocial) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @msocial, :status => :created, :location => @msocial }
        format.json  { render :json => @msocial, :status => :created, :location => @msocial }
      else
        flash[:error] = "Msocial could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @msocial.errors, :status => :unprocessable_entity }
        format.json  { render :json => @msocial.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /msocials/:id
  # PUT /msocials/:id.js
  # PUT /msocials/:id.xml
  # PUT /msocials/:id.json
  def update
    respond_to do |format|
      if @msocial.update_attributes(params[:msocial])
        flash[:notice] = "Msocial was successfully updated."
        format.html { redirect_to(@msocial) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Msocial could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @msocial.errors, :status => :unprocessable_entity }
        format.json  { render :json => @msocial.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /msocials/:id
  # DELETE /msocials/:id.js
  # DELETE /msocials/:id.xml
  # DELETE /msocials/:id.json
  def destroy
    respond_to do |format|
      if @msocial.destroy
        flash[:notice] = "Msocial was successfully destroyed."
        format.html { redirect_to(msocials_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Msocial could not be destroyed."
        format.html { redirect_to(msocial_url(@msocial)) }
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
      @collection = @msocials ||= Msocial.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @msocial ||= Msocial.find(params[:id])
    end
    alias :load_resource :resource
    
end