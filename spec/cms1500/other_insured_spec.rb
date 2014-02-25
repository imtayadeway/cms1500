require 'spec_helper'

module Cms1500
  describe OtherInsured do
    subject { OtherInsured.new($stdout) }
    it_behaves_like "a person"
    it_behaves_like "an insured person"
  end
end
