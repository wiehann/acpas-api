require 'spec_helper'


describe Acpas::API::Errors::ClientError do
  it { should be_a RuntimeError }
end

describe Acpas::API::Errors::EnvironmentError do
  it { should be_a RuntimeError }
end

describe Acpas::API::Errors::ConnectionError do
  it { should be_a RuntimeError }
end

describe Acpas::API::Errors::AuthenticationError do
  it { should be_a RuntimeError }
end

describe Acpas::API::Errors::InsertFailureError do
  it { should be_a RuntimeError }
end

describe Acpas::API::Errors::ResponseFailedError do
  it { should be_a RuntimeError }
end