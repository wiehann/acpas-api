module Acpas
  module API
    module Errors
      class ConnectionError < RuntimeError;     end
      class AuthenticationError < RuntimeError; end
      class InsertFailureError < RuntimeError;  end
      class ResponseFailedError < RuntimeError; end
    end
  end
end