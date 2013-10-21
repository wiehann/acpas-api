module Acpas
  class API
    module Environments
      extend ActiveSupport::Autoload
      autoload :Live
      autoload :Test
    end
  end
end
