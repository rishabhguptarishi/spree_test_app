Spree::Product.class_eval do

  delegate :sale_price, :sale_price=, :on_sale?, :get_price, :original_price_in, to: :find_or_build_master
end
