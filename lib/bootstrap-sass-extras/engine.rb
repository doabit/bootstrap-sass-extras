module BootstrapSassExtras
  class Engine < ::Rails::Engine
    initializer 'bootstrap-sass-extras.setup_helpers' do |app|
      app.config.to_prepare do
        ActionController::Base.send :helper, BootstrapFlashHelper
        ActionController::Base.send :helper, GlyphHelper
        ActionController::Base.send :helper, ModalHelper
        ActionController::Base.send :helper, TwitterBreadcrumbsHelper
      end
    end
  end
end
