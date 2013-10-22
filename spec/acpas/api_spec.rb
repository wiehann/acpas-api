require 'spec_helper'

describe Acpas::API do
  
  context 'mass assignment' do
    let(:vendor) { double }
    subject { Acpas::API.new(vendor: vendor) }
    its(:vendor) { should == vendor }
  end

  describe '.environment=' do
    subject { Acpas::API }

    context 'when invalid' do
      it 'raises an EnvironmentError' do
        expect{ subject.environment = nil }.to raise_error Acpas::API::Errors::EnvironmentError
      end
    end

    context 'when valid' do
      let(:env) { double(endpoint: 'acpas.co.za') }
      
      describe 'client is set with the wsdl' do
        it { expect(subject).to receive(:client).with(wsdl: 'acpas.co.za?WSDL') }
        after { subject.environment = env }
      end

      describe '#environment' do
        before { subject.environment = env }
        its(:environment) { should == env }
      end
    end

    context 'when a symbol' do
      before { subject.environment = :test }
      its(:environment) { should be_a Acpas::API::Environments::Test }
    end
  end

  describe 'vendorable' do
    let(:vendor) { double(username: 'u', password: 'p', branch_id: 1) }
    before { subject.vendor = vendor }
    its(:vendor) { should == vendor }
    its(:vendor_credentials) { should include 'USERNAME' => 'u' }
    its(:vendor_credentials) { should include 'PASSWORD' => 'p' }
    its(:vendor_credentials) { should include 'BRANCHID' => 1 }
  end

  describe '#request' do
    let(:environment) { Acpas::API::Environments::Test }
    let(:vendor_credentials) {{ 'USERNAME' => '', 'PASSWORD' => '', 'BRANCHID' => '' }}
    let(:client) { double(call: true) }
    before { subject.stub environment: environment, vendor_credentials: vendor_credentials, client: client }

    context 'when client is nil' do
      let(:client) { nil }
      it "raises a ClientError" do
        expect{ subject.operation(:method, {}).to raise_error Acpas::API::Errors::ClientError }
      end
    end

    context 'when successful' do
      let(:method) { :method }
      let(:parameters) {{ param1: true }}
      let(:client) { double(call: 'ok') }
      before { expect(client).to receive(:call).with(method, { message: vendor_credentials.merge(parameters) }) }
      before { subject.stub(client: client ) }
      let(:request) { subject.request(method, parameters) }
      it { expect(request).to be_a(Acpas::API::Response) }
      it { expect(request.action).to equal method }
      it { expect(request.body) == 'ok' }
    end

  end

end
