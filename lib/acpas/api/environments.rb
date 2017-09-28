module Acpas
  class API
    module Environments
      extend ActiveSupport::Autoload
      autoload :Betum
      autoload :Live
      autoload :Test
    end
  end
end
