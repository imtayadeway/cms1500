require 'spec_helper'

module Cms1500
  describe Physician do
    subject { Physician.new($stdout) }
    it { should respond_to(:name) }
    it { should respond_to(:npi) }
    it { should respond_to(:outside_lab) }
    it { should respond_to(:charges) }
    it { should respond_to(:diagnosis_1) }
    it { should respond_to(:diagnosis_2) }
    it { should respond_to(:diagnosis_3) }
    it { should respond_to(:diagnosis_4) }
    it { should respond_to(:medicaid_resubmission_code) }
    it { should respond_to(:original_ref_no) }
    it { should respond_to(:prior_authorization_number) }
    it { should respond_to(:federal_tax_id_number) }
    it { should respond_to(:patient_account_no) }
    it { should respond_to(:accept_assignment) }
    it { should respond_to(:total_charge) }
    it { should respond_to(:amount_paid) }
    it { should respond_to(:balance_due) }
    it { should respond_to(:service_facility_location_information) }
    it { should respond_to(:billing_provider_info) }
  end
end
