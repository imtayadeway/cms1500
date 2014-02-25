require 'spec_helper'

module Cms1500
  describe Insured do
    it_behaves_like "a person"
    it_behaves_like "an insured person"
    it { should respond_to(:program) }
    it { should respond_to(:another_plan) }
  end
end
