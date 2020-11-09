Spree::Price.class_eval do
  
  def price_including_vat_for(price_options)
    options = price_options.merge(tax_category: variant.tax_category)
    if variant.sale_price.present?
      gross_amount(variant.sale_price, options)
    else
      gross_amount(price, options)
    end
  end
end