class TeamUsersController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /team_users
  # GET /team_users.js
  # GET /team_users.xml
  # GET /team_users.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @team_users }
      format.json  { render :json => @team_users }
    end
  end
  
  # GET /team_users/:id
  # GET /team_users/:id.js
  # GET /team_users/:id.xml
  # GET /team_users/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @team_users }
      format.json  { render :json => @team_users }
    end
  end
  
  # GET /team_users/new
  # GET /team_users/new.js
  # GET /team_users/new.xml
  # GET /team_users/new.json
  def new
    @team_user = TeamUser.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @team_user }
      format.json  { render :json => @team_user }
    end
  end
  
  # GET /team_users/:id/edit
  def edit
  end
  
  # POST /team_users
  # POST /team_users.js
  # POST /team_users.xml
  # POST /team_users.json
  def create
    @team_user = TeamUser.new(params[:team_user])
    
    respond_to do |format|
      if @team_user.save
        flash[:notice] = "Team user was successfully created."
        format.html { redirect_to(@team_user) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @team_user, :status => :created, :location => @team_user }
        format.json  { render :json => @team_user, :status => :created, :location => @team_user }
      else
        flash[:error] = "Team user could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @team_user.errors, :status => :unprocessable_entity }
        format.json  { render :json => @team_user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /team_users/:id
  # PUT /team_users/:id.js
  # PUT /team_users/:id.xml
  # PUT /team_users/:id.json
  def update
    respond_to do |format|
      if @team_user.update_attributes(params[:team_user])
        flash[:notice] = "Team user was successfully updated."
        format.html { redirect_to(@team_user) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Team user could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @team_user.errors, :status => :unprocessable_entity }
        format.json  { render :json => @team_user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /team_users/:id
  # DELETE /team_users/:id.js
  # DELETE /team_users/:id.xml
  # DELETE /team_users/:id.json
  def destroy
    respond_to do |format|
      if @team_user.destroy
        flash[:notice] = "Team user was successfully destroyed."
        format.html { redirect_to(team_users_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Team user could not be destroyed."
        format.html { redirect_to(team_user_url(@team_user)) }
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
      @collection = @team_users ||= TeamUser.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @team_user ||= TeamUser.find(params[:id])
    end
    alias :load_resource :resource
    
end