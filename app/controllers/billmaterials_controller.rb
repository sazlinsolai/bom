class BillmaterialsController < ApplicationController
  
  in_place_edit_for :product_info, :specification
  in_place_edit_for :product_info, :qty_strip
  in_place_edit_for :product_info, :stamping_location
  
  # GET /billmaterials
  # GET /billmaterials.xml
  def index
    @products = Product.find(:all)
    #@billmaterials = Billmaterial.find_by_sql(["select distinct bom_master from billmaterials"])
  end
  
  def index2
    @billmaterials = Billmaterial.find( :all, :conditions => 'parent_id = 0', :include => [ { :children => [ :children, :parent ] }, :parent ] )
    #@billmaterial = Billmaterial.find(:first)
    #@id = params[:id]
   # @parent = Billmaterial.find(:first, :conditions => "bom_master_id = '#{@id}' and bom_product_id = '#{@id}' and parent_id = 0 ")
  end
  
  #GET /bomlist.html.erb
  def bomlist
    @billmaterials = Billmaterial.find(:all)
  end

  # GET /billmaterials/1
  # GET /billmaterials/1.xml
  #start of method to show billmaterial in tree view
  def show
    @billmaterials = Billmaterial.find(:all)
    @billmaterial = Billmaterial.find(:first)
    
    # this code below is for showing the tree no matter user select the parent or the child, the tree will show all node for that parent
    @id = params[:id]
    @parent = Billmaterial.find(:first, :conditions => "bom_master_id = '#{@id}' and parent_id = 0 ")
    # select according to your choice...
    #this @billmaterial will be selected node by default in the tree when it will first be loaded.
    #to show all bom under a master bom: billmaterials/alldata
    @bill = Billmaterial.find(:all, :conditions => "bom_master_id = '#{@id}'")
    #to show all product_info for the product in bom : billmaterials/alldata
    #@prod_info = ProductInfo.new
    @prod_info = ProductInfo.find_all_by_bom_master_id(@id)
  end

  def display_clicked_item
    # this action will handle the two way syncronization...all the tree nodes(billmaterials) will be linked
    # to this action to show the detailed billmaterial on the left of the tree when the billmaterial is clicked
    # from the tree
    if request.xhr?
      @billmaterial = Billmaterial.find(params[:id]) rescue nil
      if @billmaterial
        # the code below will render all your RJS code inline and
        # u need not to have any .rjs file, isnt this interesting
        render :update do |page|
          page.hide "selected_item"
          page.replace_html "selected_item", :partial=>"billmaterials/billmaterial", :object=>@billmaterial
          page.visual_effect 'toggle_appear', "selected_item"
        end
      else
        render :nothing => true
      end
    end
  end
  
  
#end of method to show billmaterial in tree view
  
  # GET /billmaterials/new
  # GET /billmaterials/new.xml
  def new
    @billmaterial_id = params[:bom_id]
    #@bill_id = Billmaterial.find(:first, :conditions =>"product_id = '#{params[:id]}' or bom_product_id = '#{params[:id]}'" )
    @billmaterial = Billmaterial.new
    #@billmaterial.product = Product.find(params[:bom_product_id])
    #@billmaterial = Billmaterial.find_by_product_id(params[:id])
    @products = Product.find(params[:bom_master_id])
    #@billmaterials = Billmaterial.find(:all, :conditions => "product_id = '#{params[:bom_product_id]}' and parent_id != 0")
    @master = params[:bom_master]
    @master_id = params[:bom_master_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @billmaterial }
    end
  end

  # GET /billmaterials/1/edit
  def edit
    @billmaterial = Billmaterial.find(params[:id])
  end

  # POST /billmaterials
  # POST /billmaterials.xml
  def create
    @billmaterial = Billmaterial.new(params[:billmaterial])
      if @billmaterial.save
        flash[:notice] = 'Billmaterial was successfully created.'
        @product_info = ProductInfo.create(:product_id => params[:billmaterial][:bom_master_id], :bom_master_id => params[:billmaterial][:bom_master_id])
        #@billmaterials = Billmaterial.find(:all, :conditions => "product_id = '#{params[:billmaterial][:product_id]}' and parent_id != 0")
        redirect_to :action =>'show', :controller => 'billmaterials', :id => params[:billmaterial][:bom_master_id]
      else
        flash[:notice] = 'Billmaterial creation unsuccessfull.'
        #@billmaterials = Billmaterial.find(:all, :conditions => "product_id = '#{params[:billmaterial][:product_id]}' and parent_id != 0")
         redirect_to :action =>'show', :controller => 'billmaterials', :id => params[:billmaterial][:bom_master_id]
      end
  end

  def create_master_bom
    @billmaterial = Billmaterial.new 
    @billmaterial.product = Product.find(params[:id])
    @product = Product.find(params[:id])
    @parent_id = params[:parent_id]
    @billmaterial = Billmaterial.create(:bom_master => "#{@product.product_no}" +':' + "#{@product.product_name}", :bill_name => @product.product_name,
     :bill_no => @product.product_no, :parent_id => @parent_id, :bom_master_id => @product.id)
    @product_info = ProductInfo.create(:product_id => params[:id], :bom_master_id => params[:id])
   flash[:notice] = 'Billmaterial creation successfull.'
    redirect_to billmaterial_path
  end
  
  # PUT /billmaterials/1
  # PUT /billmaterials/1.xml
  def update
    @billmaterial = Billmaterial.find(params[:id])

    respond_to do |format|
      if @billmaterial.update_attributes(params[:billmaterial])
        flash[:notice] = 'Billmaterial was successfully updated.'
        format.html { redirect_to(@billmaterial) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @billmaterial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /billmaterials/1
  # DELETE /billmaterials/1.xml
  def destroy
    @billmaterial = Billmaterial.find(params[:id])
    @billmaterial.destroy

    respond_to do |format|
      format.html { redirect_to(billmaterials_url) }
      format.xml  { head :ok }
    end
  end
  
  #autocomplete part
  def auto_complete_for_product_product_no
    @product = Product.find(:all, :conditions => ['LOWER(product_no) LIKE ?', '%' + params[:product][:product_no].downcase + '%' ],
      :order => 'product_no ASC', 
      :limit => 8)
    render :partial => 'bill_billno'
  end
  
  def get_billno_full
    @product = Product.find(params[:id].to_i)
    render :partial => 'get_billno_full'
  end
  
  def get_bill_name
    @product = Product.find(params[:id].to_i)
    render :partial => 'get_bill_name'
  end
  
  def get_bill_desc
    @product = Product.find(params[:id].to_i)
    render :partial => 'get_bill_desc'
  end
  
  def set_product_info_qty_strip
    #@product_info = ProductInfo.new
    @product_info = ProductInfo.find(params[:id])
    #previous_qty = @product_info.qty_strip
    qty_strip = params[:product_info][:qty_strip]
    @product_info.update_attribute('qty_strip', qty_strip)
    #@product_info.qty_strip = qty_strip
    @sum = qty_strip
  end
end
