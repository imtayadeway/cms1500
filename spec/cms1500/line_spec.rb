require 'spec_helper'

module Cms1500
  describe Line do
    let(:form) { double('form') }
    subject { Line.new(form) }
    it { should respond_to(:content) }
  end
end
