class PlaceOrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_place_order, only: [:show, :edit, :update, :destroy]

  # GET /place_orders
  # GET /place_orders.json

  def index
    @place_orders = PlaceOrder.all
  end

  # GET /place_orders/1
  # GET /place_orders/1.json
  def show
  end

  # GET /place_orders/new
  def new
    @place_order = PlaceOrder.new
  end

  # GET /place_orders/1/edit
  def edit
  end

  # POST /place_orders
  # POST /place_orders.json
  def create
    @place_order = PlaceOrder.new(place_order_params)
    @place_order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @place_order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderMailer.received(@place_order).deliver_later
        format.html { redirect_to index_url, notice: 'Thank you for choosing us. Your order has been placed.' }
        format.json { render :show, status: :created, location: @place_order }
      else
        format.html { render :new }
        format.json { render json: @place_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /place_orders/1
  # PATCH/PUT /place_orders/1.json
  def update
    respond_to do |format|
      if @place_order.update(place_order_params)
        format.html { redirect_to @place_order, notice: 'Place order was successfully updated.' }
        format.json { render :show, status: :ok, location: @place_order }
      else
        format.html { render :edit }
        format.json { render json: @place_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_orders/1
  # DELETE /place_orders/1.json
  def destroy
    @place_order.destroy
    respond_to do |format|
      format.html { redirect_to place_orders_url, notice: 'Place order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def ensure_cart_isnt_empty
      if @cart.line_items.empty?
        redirect_to index_url, notice: 'Your cart is empty'
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_place_order
      @place_order = PlaceOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_order_params
      params.require(:place_order).permit(:name, :address, :email, :pay_type)
    end
end
