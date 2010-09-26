class AccessesController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /accesses
  # GET /accesses.js
  # GET /accesses.xml
  # GET /accesses.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @accesses }
      format.json  { render :json => @accesses }
    end
  end
  
  # GET /accesses/:id
  # GET /accesses/:id.js
  # GET /accesses/:id.xml
  # GET /accesses/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @accesses }
      format.json  { render :json => @accesses }
    end
  end
  
  # GET /accesses/new
  # GET /accesses/new.js
  # GET /accesses/new.xml
  # GET /accesses/new.json
  def new
    @access = Access.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @access }
      format.json  { render :json => @access }
    end
  end
  
  # GET /accesses/:id/edit
  def edit
  end
  
  # POST /accesses
  # POST /accesses.js
  # POST /accesses.xml
  # POST /accesses.json
  def create
    @access = Access.new(params[:access])
    
    respond_to do |format|
      if @access.save
        flash[:notice] = "Access was successfully created."
        format.html { redirect_to(@access) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @access, :status => :created, :location => @access }
        format.json  { render :json => @access, :status => :created, :location => @access }
      else
        flash[:error] = "Access could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @access.errors, :status => :unprocessable_entity }
        format.json  { render :json => @access.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /accesses/:id
  # PUT /accesses/:id.js
  # PUT /accesses/:id.xml
  # PUT /accesses/:id.json
  def update
    respond_to do |format|
      if @access.update_attributes(params[:access])
        flash[:notice] = "Access was successfully updated."
        format.html { redirect_to(@access) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Access could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @access.errors, :status => :unprocessable_entity }
        format.json  { render :json => @access.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /accesses/:id
  # DELETE /accesses/:id.js
  # DELETE /accesses/:id.xml
  # DELETE /accesses/:id.json
  def destroy
    respond_to do |format|
      if @access.destroy
        flash[:notice] = "Access was successfully destroyed."
        format.html { redirect_to(accesses_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Access could not be destroyed."
        format.html { redirect_to(access_url(@access)) }
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
      @collection = @accesses ||= Access.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @access ||= Access.find(params[:id])
    end
    alias :load_resource :resource
    
end