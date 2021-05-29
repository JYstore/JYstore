module ProductsHelper
  def render_product_status(product)
    if product.is_hidden
      content_tag(:span, "(已上架)", :class => "product-publish")
    else
      content_tag(:span, "(未上架)", :class => "product-hidden")
    end
  end
end
