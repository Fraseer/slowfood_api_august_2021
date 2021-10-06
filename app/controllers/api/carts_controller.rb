class Api::CartsController < ApplicationController
  before_action :authenticate_user!, only: :create
  rescue_from ActiveRecord::RecordNotFound, with: :custom_error

  def create
    product = Product.find(params['product_id'])
    cart = current_user.carts.create
    cart.cart_products.create(product_id: product.id)
    render_response(cart)
  end

  private

  def custom_error
    render json: { message: 'Product not found!' }, status: 422
  end

  def render_response(cart)
    render json: {
      message: "#{cart.products[0].name} was added to your cart!",
      cart: {
        cart_id: cart.id,
        products: {
          product_1: {
            product_id: cart.products[0].id,
            name: cart.products[0].name
          }
        }
      }
    }, status: 201
  end
end
