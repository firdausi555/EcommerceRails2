class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    if params[:query]
      @products=Product.search(query)
    else
      @products=Product.all
    end
    if current_user&.role=="seller"
      @user=User.find(current_user.id)
      @products=@user.products
    else
      @products=Product.all
      @categories = Category.all
    end
  end



  # GET /products/1 or /products/1.json
  def show
    @product=Product.find(params[:id])
  end

  # # GET /products/new
  # def new
  #   @product = Product.new
  #   @categories = Category.all.pluck(:name, :id)
  # end
  def new
  @product = Product.new
  @categories = Category.all # This will return an ActiveRecord Relation of Category objects
  end


  # GET /products/1/edit
  def edit
    @categories = Category.all
  end

  # POST /products or /products.json
  def create
    @user=User.find(current_user.id)
    @product = @user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :size, :colour, :category_id, :user_id, :image, :discount)
    end
end
