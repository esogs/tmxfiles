require 'xml'

class XmlfilesController < ApplicationController
  # GET /xmlfiles
  # GET /xmlfiles.xml
  def index
    @xmlfiles = Xmlfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @xmlfiles }
    end
  end

  # GET /xmlfiles/1
  # GET /xmlfiles/1.xml
  def show
#    render :text => params[:id].to_s, :content_type => 'text/plain'
    @xmlfile = Xmlfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @xmlfile }
    end
  end

   # GET /xmlfiles/send
  # GET /xmlfiles/send
  def sendfile
    @xmlfile = Xmlfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => Hash.from_xml(@xmlfile.source_data).to_json }
#      format.xml { render :xml => @xmlfile.source_data }
      format.xml {
        @sendfile = ""
        doc = XML::Document.string(Xmlfile.first.source_data)  
        phrases = doc.find('/language/phrasetype/phrase')
        targetdoc = XML::Document.string(Xmlfile.first.target_data)  
        tphrases = targetdoc.find('/language/phrasetype/phrase')
        sourcehash = createsourcehash(phrases) # a private function
        targethash = createtargethash(tphrases) # a private function
        @sendfile = createTMX(sourcehash, targethash)
        render :sendfile
      }
    end
  end

  # GET /xmlfiles/new
  # GET /xmlfiles/new.xml
  def new
    @xmlfile = Xmlfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @xmlfile }
    end
  end

  # GET /xmlfiles/1/edit
  def edit
    @xmlfile = Xmlfile.find(params[:id])
  end

  # POST /xmlfiles
  # POST /xmlfiles.xml
  def create
    @xmlfile = Xmlfile.new(params[:xmlfile])

    respond_to do |format|
      if @xmlfile.save
        format.html { redirect_to(@xmlfile, :notice => 'Xmlfile was successfully created.') }
        format.xml  { render :xml => @xmlfile, :status => :created, :location => @xmlfile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @xmlfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /xmlfiles/1
  # PUT /xmlfiles/1.xml
  def update
    @xmlfile = Xmlfile.find(params[:id])

    respond_to do |format|
      if @xmlfile.update_attributes(params[:xmlfile])
        format.html { redirect_to(@xmlfile, :notice => 'Xmlfile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @xmlfile.errors, :status => :unprocessable_entity }
      end
    end
  end

  def save
    @xmlfile = Xmlfile.new(params[:xmlfile])
    if @xmlfile.save
      redirect_to(:action => 'show', :id => @xmlfile.id)
    else
      render(:action => :new)
    end
  end

  # DELETE /xmlfiles/1
  # DELETE /xmlfiles/1.xml
  def destroy
    @xmlfile = Xmlfile.find(params[:id])
    @xmlfile.destroy

    respond_to do |format|
      format.html { redirect_to(xmlfiles_url) }
      format.xml  { head :ok }
    end
  end

  private

  def createsourcehash(phrases)
    sourcehash = Hash.new {|hash,key| hash[key] = Array.new}
    phrases.each do |phrase|
      phrase.attributes.each do |attr| 
        if "#{attr.name}" == "name"  
          sourcehash["#{attr.value}"] << "#{phrase.content}"      
        end
      end
    end
    return sourcehash
  end

  def createtargethash(tphrases)
    targethash = Hash.new {|hash,key| hash[key] = Array.new}
    tphrases.each do |tphrase|
      tphrase.attributes.each do |tattr|
        if "#{tattr.name}" == "name"
          targethash["#{tattr.value}"] << "#{tphrase.content}"      
        end
      end
    end
    return targethash
  end

  def createTMX(sourcehash, targethash)
    sendfile = Array.new
    tuid = 0
    sourcehash.each do |key,value|
      if targethash.has_key?(key)
        sendfile[tuid] = value.to_s, targethash[key].to_s # I think we build an array of arrays?
        tuid += 1
       end
    end
    return sendfile
  end

end
