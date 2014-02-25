require 'spec_helper'

module Cms1500
  describe Patient do
    subject { Patient.new($stdout) }
    it_behaves_like "a person"
    it { should respond_to(:relationship_to_insured) }
    it { should respond_to(:status) }
    it { should respond_to(:condition) }

  end
end
