require 'active_attr'
module Acpas
  module API
    class Vendor
      attr_accessor :username, :password, :branch_id
      include ActiveAttr::MassAssignment
    end
  end
end
