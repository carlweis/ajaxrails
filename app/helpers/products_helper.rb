module ProductsHelper

  def product_state_display state
    case state
    when 'outofstock'
      'Out of Stock'
    when 'instock'
      'In-Stock'
    when 'backordered'
    when 'discontinued'
      state.capitalize
    else
      state.capitalize
    end
  end
end
