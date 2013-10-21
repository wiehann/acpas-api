require 'active_attr'
module Acpas
  class API
    class Vendor
      include ActiveAttr::Attributes
      attribute :username
      attribute :password
      attribute :branch_id
      include ActiveAttr::MassAssignment
    end
  end
end
