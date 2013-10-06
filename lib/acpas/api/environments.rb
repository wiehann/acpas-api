module Acpas
  module API
    module Environments

      class Live
        def self.endpoint
          'https://secure.acpas.co.za/wsIntegration/externalintegration.asmx'
        end
      end

      class Test
        def self.endpoint
          'http://test.acpas.co.za/wsIntegration/externalintegration.asmx'
        end
      end

    end
  end
end
