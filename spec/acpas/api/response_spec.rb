require 'spec_helper'

describe Acpas::API::Response do

  describe '#result' do
    before do
      subject.action = :action
      subject.body = double(body: { action_response: { action_result: 'success' }})
    end
    its(:result) { should == 'success' }
    describe '#handle_result' do
      it { expect(subject).to receive :handle_result }
      after { subject.result }
    end
  end

  describe '#handle_result' do
    before { subject.stub result: result }

    context 'when ok' do
      let(:result) { 'ok' }
      it { expect{ subject.handle_result }.to_not raise_error }
    end

    context 'when insert failure' do
      let(:result) { '-1' }
      it { expect{ subject.handle_result }.to raise_error Acpas::API::Errors::InsertFailureError }
    end

    context 'when authentication error' do
      let(:result) { '-2' }
      it { expect{ subject.handle_result }.to raise_error Acpas::API::Errors::AuthenticationError }
    end

    context 'when connection error' do
      let(:result) { '-3' }
      it { expect{ subject.handle_result }.to raise_error Acpas::API::Errors::ConnectionError }
    end
  end

end