Spree::Product.class_eval do

  delegate :sale_price, :sale_price=, :on_sale?, :selling_price, to: :find_or_build_master
end
