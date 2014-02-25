module Cms1500
  class Insured < InsuredPerson
    include ActiveModel::Validations
    include Section

    validate :valid_program

    attr_accessor :program, :another_plan

    def valid_program
      unless [:medicare, :medicaid, :tricare, :other].include?(program)
        errors.add(:program, "must be in medicare/medicaid/tricare/other")
      end
    end
  end
end
