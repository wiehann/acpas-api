module Acpas
  class API
    module Errors
      class EnvironmentError < RuntimeError;    end
      class ClientError < RuntimeError;         end
      class ConnectionError < RuntimeError;     end
      class AuthenticationError < RuntimeError; end
      class InsertFailureError < RuntimeError;  end
      class ResponseFailedError < RuntimeError; end
    end
  end
end