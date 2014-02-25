shared_examples_for "a person" do
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:middle_initial) }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:telephone) }
  it { should respond_to(:date_of_birth) }
  it { should respond_to(:sex) }

  describe "#name" do
    context "without a middle initial" do
      before do
        subject.first_name = 'Jane'
        subject.last_name = 'Doe'
      end

      it "does not print a trailing comma" do
        expect(subject.name).to eq('Doe, Jane')
      end
    end
  end
end

shared_examples_for "an insured person" do
  it { should respond_to(:id_number) }
  it { should respond_to(:policy_number) }
  it { should respond_to(:group_number) }
  it { should respond_to(:feca_number) }
  it { should respond_to(:employer_name) }
  it { should respond_to(:school_name) }
  it { should respond_to(:plan_name) }
  it { should respond_to(:program_name) }
end
