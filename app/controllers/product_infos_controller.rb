class ProductInfosController < ApplicationController
  # GET /product_infos
  # GET /product_infos.xml
  def index
    @product_infos = ProductInfo.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_infos }
    end
  end

  # GET /product_infos/1
  # GET /product_infos/1.xml
  def show
    @product_info = ProductInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_info }
    end
  end

  # GET /product_infos/new
  # GET /product_infos/new.xml
  def new
    @product_info = ProductInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_info }
    end
  end

  # GET /product_infos/1/edit
  def edit
    @product_info = ProductInfo.find(params[:id])
  end

  # POST /product_infos
  # POST /product_infos.xml
  def create
    @product_info = ProductInfo.new(params[:product_info])

    respond_to do |format|
      if @product_info.save
        flash[:notice] = 'ProductInfo was successfully created.'
        format.html { redirect_to(@product_info) }
        format.xml  { render :xml => @product_info, :status => :created, :location => @product_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_infos/1
  # PUT /product_infos/1.xml
  def update
    @product_info = ProductInfo.find(params[:id])

    respond_to do |format|
      if @product_info.update_attributes(params[:product_info])
        flash[:notice] = 'ProductInfo was successfully updated.'
        format.html { redirect_to(@product_info) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_infos/1
  # DELETE /product_infos/1.xml
  def destroy
    @product_info = ProductInfo.find(params[:id])
    @product_info.destroy

    respond_to do |format|
      format.html { redirect_to(product_infos_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
end
