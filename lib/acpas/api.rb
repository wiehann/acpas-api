require 'active_attr'

module Acpas
  module API
    extend ActiveSupport::Autoload

    # ---
    
    autoload :Version
    autoload :Errors
    
    # ---

    autoload :Environments
    cattr_accessor :environment
    def self.environment= env
      raise Errors::EnvironmentError.new "Invalid environment: #{env}" unless env.respond_to?(:endpoint)
      super env
      client wsdl: env.endpoint + '?WSDL'
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

    autoload :Operation
    def operation action, parameters={}
      Operation::Base.new(client: client, action: action, parameters: parameters).tap do |o|
        o.perform vendor_credentials.merge(parameters)
      end
    end
    def boolean_operation action, parameters={}
      operation(action, parameters).becomes(Operation::Boolean)
    end

    # ---

    include ActiveAttr::MassAssignment

  end
end


