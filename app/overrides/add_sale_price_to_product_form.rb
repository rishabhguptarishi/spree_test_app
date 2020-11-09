Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'add_sale_price_to_product_form',
  insert_after: "[data-hook='admin_product_form_price']",
  text: "
    <div class='form-group' data-hook='sale_price'>
      <%= f.label :sale_price, raw(Spree.t(:sale_price) + content_tag(:span, ' *')) %>
      <%= f.text_field :sale_price, value:
        number_to_currency(@product.sale_price, unit: ''), class: 'form-control' %>
      <%= f.error_message_on :sale_price %>
    </div>")