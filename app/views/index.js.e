  alert('testing products');
  $('#products').html('<%= escape_javascript render(@products) %>');
  $('#paginator').html('<%= escape_javascript(paginate(@products, :remote => true).to_s) %>');
