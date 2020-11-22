Spree::ProductsHelper.module_eval do

  def variant_full_price(variant)
    product = variant.product
    unless product.variants.active(current_currency).all? { |v| v.selling_price == product.price }
      Spree::Money.new(variant.selling_price, currency: current_currency).to_html
    end
  end

end
