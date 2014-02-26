require 'spec_helper'

module Cms1500
  describe Text do
    let(:patient) { double('patient', name: "Doe, Jane, H", sex: :female) }
    let(:form) { double('form', patient: patient) }
    subject { Text.new(form) }
    it { should respond_to(:content) }
    it { should respond_to(:generate) }
    it { should respond_to(:elements) }
  end
end
