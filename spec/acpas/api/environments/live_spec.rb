require 'spec_helper'

describe Acpas::API::Environments::Live do
  its(:endpoint) { should == 'https://secure.acpas.co.za/wsIntegration/externalintegration.asmx' }
end