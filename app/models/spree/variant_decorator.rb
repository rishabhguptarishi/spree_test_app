Spree::Variant.class_eval do

  validates :sale_price, presence: true
  validates :sale_price, numericality: { less_than: :price }

  def price_in(currency)
    Spree::Price.new(variant_id: self.id, amount: self.selling_price, currency: currency)
  end

  def on_sale?
    sale_price.present? && sale_price > 0.0
  end

  def selling_price
    on_sale? ? sale_price : price
  end
end
