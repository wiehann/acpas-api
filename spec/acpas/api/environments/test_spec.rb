require 'spec_helper'

describe Acpas::API::Environments::Test do
  its(:endpoint) { should == 'http://test.acpas.co.za/wsIntegration/externalintegration.asmx' }
end