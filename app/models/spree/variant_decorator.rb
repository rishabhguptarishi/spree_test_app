Spree::Variant.class_eval do
  
  alias_method :original_price_in, :price_in

  validates :sale_price, numericality: { less_than: :price }, allow_blank: true

  def price_in(currency)
    return original_price_in(currency) unless sale_price.present?
    Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
  end

  def on_sale?
    sale_price.present?
  end
end
