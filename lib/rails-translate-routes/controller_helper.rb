module Rails
  module TranslateRoutes
    module ControllerHelper
      private

      # called by before_filter
      def set_locale_from_url
        I18n.locale = params[RailsTranslateRoutes::LOCALE_PARAM_KEY]
        default_url_options = { RailsTranslateRoutes::LOCALE_PARAM_KEY => I18n.locale }
      end
    end
  end
end
