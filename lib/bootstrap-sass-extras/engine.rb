module BootstrapSassExtras
  class Engine < ::Rails::Engine
    initializer 'bootstrap-sass-extras.setup_helpers' do |app|
      app.config.to_prepare do
        ActionController::Base.send :helper, BootstrapFlashHelper
      end
    end
  end
end
