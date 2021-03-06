class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/send
  # GET /projects/send
  # http://guides.rubyonrails.org/form_helpers.html
  # http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-fields_for 
  def sendfile
    @project = Project.find(params[:id])
    @tmxfile = Tmxfile.find(params[:project][:tmxfile])
    @tmxdata = Tmxfile.find(params[:project][:tmxfile][:data])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => Hash.from_tmx(@project.tmxfile.data).to_json }
      format.tmx {
        @sendfile = ""
        @project.tmxfile.each do |tmxfile|
          if tmxfile.source = true
            doc = XML::Document.string(@project.tmxfile.data)
            phrases = doc.find('/language/phrasetype/phrase')
            sourcehash = createsourcehash(phrases) # a private function
          else 
            targetdoc = XML::Document.string(Project.first.target_data)  
            tphrases = targetdoc.find('/language/phrasetype/phrase')
            targethash = createtargethash(tphrases) # a private function
          end
        end
        @sendfile = createTMX(sourcehash, targethash)
        render :sendfile
      }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    @project.tmxfiles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  # http://guides.rubyonrails.org/action_controller_overview.html#hash-and-array-parameters
  # http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save 
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
