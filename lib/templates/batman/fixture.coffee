Fixtures.<%= singular_model_name.pluralize -%> =
  new<%= singular_model_name -%>:
    id: 1
<% attributes.each do |attribute| -%>
    <%= render_attribute(attribute) %>: <%= render_attribute(attribute) %>
<% end -%>
