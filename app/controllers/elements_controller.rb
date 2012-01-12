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
    association_params = {}
    element_params.keys.select{|key| key.include? 'associations'}.each{|key| association_params[key] = element_params.delete(key)}
    @element = Element.new(element_params)
    respond_to do |format|
      if @element.save
        associations = @element.category_element_associations
        association_params.each_value do |associations_param|
          category_ids = !associations_param.nil? && !associations_param[:category_ids].blank? ? associations_param[:category_ids].collect(&:to_i) : []
          root_id = !associations_param.nil? && !associations_param[:root_id].blank? ? associations_param[:root_id] : nil
          category_ids.each{|c_id| associations.create :category_id => c_id, :root_id => root_id.blank? ? Category.find(c_id).root.id : root_id}
        end
        flash[:notice] = 'Element was successfully created.'
        format.html { redirect_to elements_url }
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
      association_params = {}
      element_params.keys.select{|key| key.include? 'associations'}.each{|key| association_params[key] = element_params.delete(key)}
      if @element.update_attributes(element_params)
        association_params.each_pair do |association_key, associations_param|
          associations = @element.send(association_key)
          associated_category_ids = associations.collect(&:category_id)
          category_ids_to_be_associated = !associations_param.nil? && !associations_param[:category_ids].blank? ? associations_param[:category_ids].collect(&:to_i) : []
          root_id = !associations_param.nil? && !associations_param[:root_id].blank? ? associations_param[:root_id] : nil
          (associated_category_ids - category_ids_to_be_associated).each{|c_id| associations.all(:conditions => {:category_id => c_id}).each(&:destroy)}
          (category_ids_to_be_associated - associated_category_ids).each{|c_id| associations.create :category_id => c_id, :root_id => root_id.blank? ? Category.find(c_id).root.id : root_id}
        end
        flash[:notice] = 'Element was successfully updated.'
        format.html { redirect_to elements_url }
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