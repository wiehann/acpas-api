require 'spec_helper'

describe Acpas::API::VERSION do
  it { subject::STRING.should == '0.0.2' }
end