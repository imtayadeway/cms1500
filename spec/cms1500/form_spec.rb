require 'spec_helper'

module Cms1500
  describe Form do
    let(:output) { double('output').as_null_object }
    subject { Form.new(output: output) }

    it { should respond_to(:output) }
    it { should respond_to(:build_section) }
    it { should respond_to(:to_pdf) }
    it { should respond_to(:carrier) }
    it { should respond_to(:patient) }
    it { should respond_to(:insured) }
    it { should respond_to(:other_insured) }
    it { should respond_to(:physician) }
    its(:output) { should == output }

    describe "#build_section" do
      context "when passed some info" do
        before do
          subject.build_section(:patient) do |p|
            p.first_name = 'Jane'
            p.last_name = 'Doe'
            p.middle_initial = 'H'
          end
        end

        it "prints the info" do
          expect(output).to receive(:puts).with('Doe, Jane, H')
          subject.print
        end
      end
    end
  end
end
