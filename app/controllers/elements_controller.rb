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
    @root_category = Category.find(272)
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
    element_params = params[:element]
    element_params[:category_id] = element_params[:category_id].split(',').collect(&:strip).detect{|e| !e.blank?}
    element_params[:second_category_id] = element_params[:second_category_id].split(',').collect(&:strip).detect{|e| !e.blank?}
    category_ids = element_params.delete(:category_element_associations_id).split(',').collect(&:strip).reject(&:blank?).collect(&:to_i)
    @element = Element.new(element_params)
    respond_to do |format|
      if @element.save
        assoc = @element.category_element_associations
        category_ids.each{|c_id| assoc.create :category_id => c_id}
        flash[:notice] = 'Element was successfully created.'
        format.html { redirect_to(@element) }
        format.xml  { render :xml => @element, :status => :created, :location => @element }
      else
        @root_category = Category.find(272)
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
      element_params = params[:element]
      element_params[:category_id] = element_params[:category_id].split(',').collect(&:strip).detect{|e| !e.blank?}
      element_params[:second_category_id] = element_params[:second_category_id].split(',').collect(&:strip).detect{|e| !e.blank?}
      category_ids = element_params.delete(:category_element_associations_id).split(',').collect(&:strip).reject(&:blank?).collect(&:to_i)      
      if @element.update_attributes(element_params)
        assoc = @element.category_element_associations
        category_ids.each{|c_id| assoc.create :category_id => c_id}
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