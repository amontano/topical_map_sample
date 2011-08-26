class ElementsController < AclController
  # GET /elements
  # GET /elements.xml
  def index
    @elements = Element.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @elements }
    end
  end

  # GET /elements/1
  # GET /elements/1.xml
  def show
    @element = Element.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/new
  # GET /elements/new.xml
  def new
    @element = Element.new
    @root_category = Category.find(286)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
    @root_category = Category.find(272)
  end

  # POST /elements
  # POST /elements.xml
  def create
    #@element = Element.new(params[:element])

    mca_hash = params[:element]
    mca_cats = mca_hash[:category_id].split(',')
    #mca_secondcats = mca_hash[:second_category_id].split(',')
    errors = []
    mca_cats.each do |c|
      unless c.blank?
        c = c.to_i
        mca_hash_temp = mca_hash
        mca_hash_temp[:category_id] = c
        #mca_hash_temp[:second_category_id] = mca_secondcats.last
        @element = Element.new(mca_hash_temp)
        begin
          @element.save
        rescue ActiveRecord::StatementInvalid
          # ignore duplicate issues. how to add ignore parameter to sql query here without changing to sql completely?
        else
          errors.push( @element.errors )
        end
      end
    end



    respond_to do |format|
      #if @element.save
      #  flash[:notice] = 'Element was successfully created.'
      #  format.html { redirect_to(@element) }
      #  format.xml  { render :xml => @element, :status => :created, :location => @element }
      #else
      #  @root_category = Category.find(272)
      #  format.html { render :action => "new" }
      #  format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      #end
      unless errors.length > 0
        flash[:notice] = 'Element was successfully created.'
        format.html { redirect_to(@element) }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        @root_category = Category.find(272)
        flash[:notice] = errors.join(', ')
        format.html { render :action => "new" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @element = Element.find(params[:id])
    respond_to do |format|
      if @element.update_attributes(params[:element])
        flash[:notice] = 'Element was successfully updated.'
        format.html { redirect_to(@element) }
        format.xml  { head :ok }
      else
        @root_category = Category.find(272)
        format.html { render :action => "edit" }
        format.xml  { render :xml => @element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @element = Element.find(params[:id])
    @element.destroy

    respond_to do |format|
      format.html { redirect_to(elements_url) }
      format.xml  { head :ok }
    end
  end
end