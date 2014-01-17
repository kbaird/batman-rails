class <%= js_application_name %>.<%= singular_model_name %>Test extends Batman.ModelTestCase
  setup: ->
    @<%= singular_model_name.downcase %> = <%= js_application_name %>.<%= singular_model_name %>.createFromJSON(Fixtures.<%= singular_model_name.pluralize %>.new<%= singular_model_name %>)

  @test "is valid", ->
    @assertValid @<%= singular_model_name.downcase %>

<% attributes.each do |attribute| -%>
  @test <%= render_attribute(attribute) %>, ->
    @assetEqual <%= render_attribute(attribute) %>, @<%= singular_model_name.downcase %>.get(<%= render_attribute(attribute) %>)
<% end -%>

  @test "TODO", ->
    @assert false, "Write some real tests!"

