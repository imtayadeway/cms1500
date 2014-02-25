module Cms1500
  class Physician
    include ActiveModel::Validations
    include Section

    attr_accessor :name, :npi, :outside_lab, :charges, :diagnosis_1,
      :diagnosis_2, :diagnosis_3, :diagnosis_4, :medicaid_resubmission_code,
      :original_ref_no, :prior_authorization_number, :federal_tax_id_number,
      :patient_account_no, :accept_assignment, :total_charge, :amount_paid,
      :balance_due, :service_facility_location_information,
      :billing_provider_info
  end
end
