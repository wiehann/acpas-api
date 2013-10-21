require 'spec_helper'

describe Acpas::API::Vendor do
  it { should have_attribute :username }
  it { should have_attribute :password }
  it { should have_attribute :branch_id }
  
  describe 'mass assignment' do
    let(:attributes) {{ username: 'u', password: 'p', branch_id: 1 }}
    subject { Acpas::API::Vendor.new(attributes) }
    it 'assigns each variable' do
      attributes.keys.each do |attribute|
        expect(subject.send(attribute)).to equal attributes[attribute]
      end
    end
  end

end