class TeamsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /teams
  # GET /teams.js
  # GET /teams.xml
  # GET /teams.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @teams }
      format.json  { render :json => @teams }
    end
  end
  
  # GET /teams/:id
  # GET /teams/:id.js
  # GET /teams/:id.xml
  # GET /teams/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @teams }
      format.json  { render :json => @teams }
    end
  end
  
  # GET /teams/new
  # GET /teams/new.js
  # GET /teams/new.xml
  # GET /teams/new.json
  def new
    @team = Team.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @team }
      format.json  { render :json => @team }
    end
  end
  
  # GET /teams/:id/edit
  def edit
  end
  
  # POST /teams
  # POST /teams.js
  # POST /teams.xml
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
    
    respond_to do |format|
      if @team.save
        flash[:notice] = "Team was successfully created."
        format.html { redirect_to(@team) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @team, :status => :created, :location => @team }
        format.json  { render :json => @team, :status => :created, :location => @team }
      else
        flash[:error] = "Team could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
        format.json  { render :json => @team.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /teams/:id
  # PUT /teams/:id.js
  # PUT /teams/:id.xml
  # PUT /teams/:id.json
  def update
    respond_to do |format|
      if @team.update_attributes(params[:team])
        flash[:notice] = "Team was successfully updated."
        format.html { redirect_to(@team) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Team could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
        format.json  { render :json => @team.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /teams/:id
  # DELETE /teams/:id.js
  # DELETE /teams/:id.xml
  # DELETE /teams/:id.json
  def destroy
    respond_to do |format|
      if @team.destroy
        flash[:notice] = "Team was successfully destroyed."
        format.html { redirect_to(teams_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Team could not be destroyed."
        format.html { redirect_to(team_url(@team)) }
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
      @collection = @teams ||= Team.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @team ||= Team.find(params[:id])
    end
    alias :load_resource :resource
    
end