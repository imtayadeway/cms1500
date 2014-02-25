module Cms1500
  class Insured < InsuredPerson
    include ActiveModel::Validations
    include Section

    attr_accessor :program, :another_plan
  end
end
