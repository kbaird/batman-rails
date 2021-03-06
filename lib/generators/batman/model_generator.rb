require 'generators/common'
module Batman
  module Generators
    class ModelGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates a Batman model"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_batman_model
        with_app_name do
          template "batman/model.coffee",      "#{app_path}/models/#{singular_table_name.downcase}.js.coffee"
          template "batman/model_test.coffee", "#{app_path}/test/models/#{singular_table_name.downcase}_test.js.coffee"
          template "batman/fixture.coffee",    "#{app_path}/test/fixtures/#{singular_table_name.downcase}.js.coffee"
        end
      end

      protected
      def render_attribute(attribute)
        type = case attribute.type.to_s
        when 'date', 'datetime'
          "Batman.Encoders.railsDate"
        when 'string', 'integer', 'float', 'decimal', 'boolean', 'text'
        end

        ["'#{attribute.name}'", type].compact.join(', ')
      end
      def render_attribute_value(attribute)
        "'the-#{attribute.name}-value'"
      end
    end
  end
end
