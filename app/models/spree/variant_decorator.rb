Spree::Variant.class_eval do
  
  alias_method :original_price_in, :price_in

  validates :sale_price, presence: true
  validates :sale_price, numericality: { less_than: :price }

  def price_in(currency)
    return original_price_in(currency) unless on_sale?
    Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
  end

  def on_sale?
    sale_price.present? && sale_price > 0
  end

  def get_price
    on_sale? ? sale_price : price
  end
end
