Spree::Price.class_eval do
  
  def price_including_vat_for(price_options)
    options = price_options.merge(tax_category: variant.tax_category)
    gross_amount(variant.variant_price, options)
  end
end
