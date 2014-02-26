require 'spec_helper'

module Cms1500
  describe Box do
    it { should respond_to(:name) }
    it { should respond_to(:text?) }
    it { should respond_to(:checkbox?) }
    it { should respond_to(:source) }
    it { should respond_to(:type) }
  end
end
