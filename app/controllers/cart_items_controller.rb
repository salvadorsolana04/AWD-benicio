class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    cart = current_cart
    item = cart.cart_items.find_or_initialize_by(product: product)
    item.quantity = (item.quantity || 0) + 1
    item.save

    redirect_to cart_path, notice: "#{product.name} added to cart."
  end


  def destroy
    item = current_cart.cart_items.find(params[:id])
    item.destroy
    redirect_to cart_path, notice: "Item removed from cart."
  end
end
