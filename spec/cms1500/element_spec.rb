require 'spec_helper'

module Cms1500
  describe Element do
    let(:form) { double('form') }
    subject { Element.new(form) }
    it { should respond_to(:form) }
    it { should respond_to(:line) }
    it { should respond_to(:ljust) }
    it { should respond_to(:name) }
    it { should respond_to(:type) }
    it { should respond_to(:checkbox?) }
    it { should respond_to(:text?) }
    it { should respond_to(:source) }
    it { should respond_to(:coords) }
    it { should respond_to(:carrier) }
    it { should respond_to(:patient) }
    it { should respond_to(:insured) }
    it { should respond_to(:other_insured) }
    it { should respond_to(:physician) }
    it { should respond_to(:lines) }
  end
end  
