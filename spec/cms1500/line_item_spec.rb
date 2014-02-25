require 'spec_helper'

module Cms1500
  describe LineItem do
    subject { LineItem.new(1) }
    it { should respond_to(:number) }
    it { should respond_to(:date_of_service) }
    it { should respond_to(:emg) }
    it { should respond_to(:cpt) }
    it { should respond_to(:modifier) }
    it { should respond_to(:diagnosis_pointer) }
    it { should respond_to(:charges) }
    it { should respond_to(:units) }
    it { should respond_to(:epstd_family_plan) }
    it { should respond_to(:rendering_provider_id) }
  end
end
