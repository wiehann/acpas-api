require 'active_attr'
module Acpas
  class API
    class Response
      attr_accessor :action, :body
      include ActiveAttr::MassAssignment

      attr_reader :result
      def result
        unless @result
          @result ||= body.body[:"#{action}_response"][:"#{action}_result"]
          handle_result
        end
        @result
      end

      def handle_result
        case result.to_s # TODO chomp?
          when '-1' then raise Errors::InsertFailureError.new "Failed to insert record."
          when '-2' then raise Errors::AuthenticationError.new "Invalid credentials."
          when '-3' then raise Errors::ConnectionError.new "Couldn't connect to client."
        end
      end
    
    end
  end
end