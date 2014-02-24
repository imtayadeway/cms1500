require 'spec_helper'

module Cms1500
  describe Patient do
    subject { Patient.new($stdout) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:middle_initial) }
    it { should respond_to(:name) }
    it { should respond_to(:date_of_birth) }
    it { should respond_to(:sex) }
    it { should respond_to(:address) }
    it { should respond_to(:city) }
    it { should respond_to(:state) }
    it { should respond_to(:zip_code) }
    it { should respond_to(:telephone) }
    it { should respond_to(:) }
    it { should respond_to(:) }
    it { should respond_to(:) }
    it { should respond_to(:) }
    it { should respond_to(:) }
    it { should respond_to(:) }
  end
end

    p.date_of_birth '1900-01-01'
    p.sex :female
    p.address '123 Fake Street'
    p.city 'Springfield'
    p.state 'OR'
    p.zip_code 12345
    p.telephone 1234567890
    p.relationship_to_insured :self
    p.status :single, :employed
    p.condition :employment, :auto
