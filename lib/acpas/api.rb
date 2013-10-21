require 'active_support'
require 'active_attr'
require 'savon'

module Acpas
  class API
    include ActiveAttr::MassAssignment
    extend ActiveSupport::Autoload
    extend Savon::Model

    # ---
    
    autoload :Version
    autoload :Errors
    
    # ---

    autoload :Environments
    class << self
      def environment= env
        ActiveSupport::Inflector.tap do |inflector|
          env = inflector.constantize("Acpas::API::Environments::#{inflector.classify(env.to_s)}").new
        end if env.is_a?(Symbol)

        raise Errors::EnvironmentError.new "Invalid environment: #{env}" unless env.respond_to?(:endpoint)
        @environment = env
        client wsdl: env.endpoint + '?WSDL'
      end
      attr_reader :environment
    end

    # ---

    autoload :Vendor
    attr_accessor :vendor
    def vendor_credentials
      {
        'USERNAME' => vendor.username,
        'PASSWORD' => vendor.password,
        'BRANCHID' => vendor.branch_id          
      }
    end

    # ---

    autoload :Response
    def request action, parameters={}
      raise Errors::ClientError.new "No valid SOAP client." unless client
      response = client.call action, vendor_credentials.merge(parameters)
      Response.new(action: action, body: response)
    end

    # ---

  end
end


# Acpas::API.environment = :test
# api = Acpas::API.new(username: 'x', password: 'y')
# response = api.request :insert_new_customer, { }
# response.result # => '1'

