class HomeController < ApplicationController
  def index
    # Load categories
    @categories = Category.all

    # Start with all products
    @products = Product.all

    # Role-based logic: redirect based on user role
    if current_user&.role == "admin"
      redirect_to admin_path and return
    elsif current_user&.role == "seller"
      @user = current_user
      @products = @user.products
    end

    # Apply search filter if query is present
    if params[:query].present?
      # Call the model search method and handle any errors
      @products = Product.search(params[:query])
      if @products.nil? || @products.empty?
        flash.now[:alert] = "No products found matching your query."
      end
    end

    # Apply filters if present (category, discount, price)
    filter_by_category if params[:category].present?
    filter_by_discount if params[:discount].present?
    filter_by_price if params[:price].present?

    # Pagination logic (Kaminari)
    @products = @products.page(params[:page]).per(6) # Adjust per page number as needed
  end

  def admin_page
    render :admin_page
  end

  private

  # Filters by category
  def filter_by_category
    @products = @products.where(category_id: params[:category])
  end

  # Filters by discount
  def filter_by_discount
    @products = @products.where("discount >= ?", params[:discount].to_i)
  end

  # Filters by price range
  def filter_by_price
    case params[:price]
    when "under_50"
      @products = @products.where("price < ?", 50)
    when "50_100"
      @products = @products.where("price BETWEEN ? AND ?", 50, 100)
    when "100+"
      @products = @products.where("price > ?", 100)
    end
  end
end
