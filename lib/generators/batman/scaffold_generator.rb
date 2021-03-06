require 'generators/common'
module Batman
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates the client side CRUD scaffolding"
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_batman_model
        with_app_name do
          attrs = attributes.map { |a| [a.name, a.type].join(':') }.join(' ')
          generate "batman:model #{singular_model_name} #{app_name_flag} #{attrs}"
          generate "batman:controller #{plural_name} index show edit new create update destroy #{app_name_flag}"

          inject_into_file "#{app_path}/#{application_name}.js.coffee", after: "class #{js_application_name} extends Batman.App\n"  do
            route_resource
          end
        end
      end

      def route_resource
<<-CODE
\n  @resources '#{plural_name}'\n
CODE
      end

    end
  end
end
