# Adapter for Rails 3 apps
module ActionDispatch
  module Routing
    module Translator
      class << self
        def translate &block
          RailsTranslateRoutes.init_with_yield(&block).translate Rails.application.routes
        end

        def translate_from_file(file_path, options = {})
          file_path = %w(config locales routes.yml) if file_path.blank?
          r = RailsTranslateRoutes.init_from_file(file_path)
          r.prefix_on_default_locale = true if options && options[:prefix_on_default_locale] == true
          r.no_prefixes = true if options && options[:no_prefixes] == true
          r.keep_untranslated_routes = true if options && options[:keep_untranslated_routes] == true
          r.translate Rails.application.routes
        end

        def i18n *locales
          RailsTranslateRoutes.init_with_i18n(*locales).translate Rails.application.routes
        end
      end
    end
  end
end
