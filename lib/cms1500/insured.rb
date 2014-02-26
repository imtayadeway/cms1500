module Cms1500
  class Insured < InsuredPerson
    include ActiveModel::Validations
    include Section

    validate :valid_program

    attr_accessor :program, :another_plan

    def initialize(options = {}, &block)
      @first_name = options.fetch(:first_name, nil)
      @last_name = options.fetch(:last_name, nil)
      @middle_initial = options.fetch(:middle_initial, nil)
      @date_of_birth = options.fetch(:date_of_birth, nil)
      @sex = options.fetch(:sex, nil)
      @address = options.fetch(:address, nil)
      @city = options.fetch(:city, nil)
      @state = options.fetch(:state, nil)
      @zip_code = options.fetch(:zip_code, nil)
      @telephone = options.fetch(:telephone, nil)
      super(&block)
    end

    def valid_program
      unless [:medicare, :medicaid, :tricare, :other].include?(program)
        errors.add(:program, "must be in medicare/medicaid/tricare/other")
      end
    end
  end
end
