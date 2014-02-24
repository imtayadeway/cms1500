Cms1500.build_form do |f|
  f.build_section(:carrier) do |c|
  end

  f.build_section(:patient) do |p|
    p.first_name 'Jane'
    p.middle_initial 'H'
    p.last_name 'Doe'
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
  end

  f.build_section(:insured) do |i|
    i.program :medicare
    i.id_number 123456789
    i.policy_number 123456789 # or group or feca number
    # same as patient
    i.employer_name 'Mr Burns' # or school_name
    i.plan_name 'Insurance Plan' # or program_name
    i.another_plan true # requires other insured section
  end

  f.build_section(:other_insured) do |i|
    i.policy_number 1234567890
    i.date_of_birth '1900-01-01'
    i.sex :female
    i.employer_name 'Mr. Burns' # or school_name
    i.plan_name 'Insurance Plan' # or program_name
  end

  f.build_section(:physician) do |p|
    p.name 'John Doe'
    p.npi 1234567890
    p.outside_lab true
    p.charges 100.50
    p.diagnosis_1 750.1
    p.medicaid_resubmission_code
    p.original_ref_no
    p.prior_authorization_number
    p.federal_tax_id_number 12345, :ssn
    p.patient_account_no 12345
    p.accept_assignment true
    p.total_charge
    p.amount_paid
    p.balance_due
    p.service_facility_location_information
    p.billing_provider_info
  end

  f.build_line(1) do |l|
    l.date_of_service from: '2010-01-01', to: '2010-01-01'
    l.place_of_service 'Springfield'
    l.emg ''
    l.cpt '80101'
    l.modifier '59'
    l.diagnosis_pointer ''
    l.charges 100.5
    l.units 1 # or days
    l.epstd_family_plan ''
    l.rendering_provider_id
  end
end
