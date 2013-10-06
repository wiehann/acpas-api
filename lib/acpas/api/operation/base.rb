require 'active_attr'
module Acpas
  module API
    module Operation
      class Base
        include ActiveAttr::MassAssignment
        attr_accessor :client, :action, :parameters
        attr_reader :response

        def perform
          @response = client.call action, parameters
        end

        def result
          @result ||= response.body[:"#{action}_response"][:"#{action}_result"].tap do
            handle_result
          end
        end

        def handle_result
          case result.to_s # chomp?
            when '-1' then raise Errors::InsertFailureError.new "Failed to insert record."
            when '-2' then raise Errors::AuthenticationError.new "Invalid credentials."
            when '-3' then raise Errors::ConnectionError.new "Couldn't connect to wsdl: #{client.wsdl}"
          end
        end

      end
    end
  end
end