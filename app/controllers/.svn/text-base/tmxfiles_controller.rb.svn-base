class TmxfilesController < ApplicationController
  # GET /tmxfiles
  # GET /tmxfiles.tmx
  def index
    @tmxfiles = Tmxfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.tmx  { render :tmx => @tmxfiles }
    end
  end

  # GET /tmxfiles/1
  # GET /tmxfiles/1.tmx
  def show
    @tmxfile = Tmxfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.tmx  { render :tmx => @tmxfile }
    end
  end

    # GET /tmxfiles/send
  # GET /tmxfiles/send
  def sendfile
    @tmxfile = Tmxfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => Hash.from_tmx(@tmxfile.source_data).to_json }
#      format.tmx { render :tmx => @tmxfile.source_data }
      format.tmx {
        @sendfile = ""
        doc = XML::Document.string(Tmxfile.first.source_data)  
        phrases = doc.find('/language/phrasetype/phrase')
        targetdoc = XML::Document.string(Tmxfile.first.target_data)  
        tphrases = targetdoc.find('/language/phrasetype/phrase')
        sourcehash = createsourcehash(phrases) # a private function
        targethash = createtargethash(tphrases) # a private function
        @sendfile = createTMX(sourcehash, targethash)
        render :sendfile
      }
    end
  end
 


  # GET /tmxfiles/new
  # GET /tmxfiles/new.tmx
  def new
    @tmxfile = Tmxfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.tmx  { render :tmx => @tmxfile }
    end
  end

  # GET /tmxfiles/1/edit
  def edit
    @tmxfile = Tmxfile.find(params[:id])
  end

  # POST /tmxfiles
  # POST /tmxfiles.tmx
  def create
    @tmxfile = Tmxfile.new(params[:tmxfile])

    respond_to do |format|
      if @tmxfile.save
        format.html { redirect_to(@tmxfile, :notice => 'Tmxfile was successfully created.') }
        format.tmx  { render :tmx => @tmxfile, :status => :created, :location => @tmxfile }
      else
        format.html { render :action => "new" }
        format.tmx  { render :tmx => @tmxfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tmxfiles/1
  # PUT /tmxfiles/1.tmx
  def update
    @tmxfile = Tmxfile.find(params[:id])

    respond_to do |format|
      if @tmxfile.update_attributes(params[:tmxfile])
        format.html { redirect_to(@tmxfile, :notice => 'Tmxfile was successfully updated.') }
        format.tmx  { head :ok }
      else
        format.html { render :action => "edit" }
        format.tmx  { render :tmx => @tmxfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tmxfiles/1
  # DELETE /tmxfiles/1.tmx
  def destroy
    @tmxfile = Tmxfile.find(params[:id])
    @tmxfile.destroy

    respond_to do |format|
      format.html { redirect_to(tmxfiles_url) }
      format.tmx  { head :ok }
    end
  end
end
