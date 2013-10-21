module Acpas
  class API
    module Environments
      class Live
        def endpoint
          'https://secure.acpas.co.za/wsIntegration/externalintegration.asmx'
        end
      end
    end
  end
end