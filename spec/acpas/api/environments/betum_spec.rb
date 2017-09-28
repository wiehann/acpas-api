require 'spec_helper'

describe Acpas::API::Environments::Betum do
  its(:endpoint) { should == 'https://beta.acpas.co.za/wsIntegration/externalintegration.asmx' }
end
