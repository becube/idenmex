module ProductsHelper

  def products_combo
    Product.all.map { |product| [product.name, product.id] }
  end

   def link_to_add_fields name, css_class 
    product_id = rand(1..1000)
    fields = render('products_fields', product_id: product_id) 
    link_to(name, '#', class: "add_fields #{css_class}", data: {id: product_id, fields: fields.gsub("\n", "")})
  end 

  def offer_display_field product
    return "display: none;" unless product.on_offer?
  end

  def offer_label product
    return "En oferta" if product.on_offer?
  end
end
