require 'rails/generators'

module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap locale"

      def add_locale
        if File.exist?("config/locales/en.bootstrap.yml")
          localez = File.read("config/locales/en.bootstrap.yml")
          insert_into_file "config/locales/en.bootstrap.yml", localez, :after => "en\n"
        else
          copy_file "en.bootstrap.yml", "config/locales/en.bootstrap.yml"
        end
      end

    end
  end
end
