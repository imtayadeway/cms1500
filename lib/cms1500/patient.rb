module Cms1500
  class Patient < Person
    include ActiveModel::Validations
    include Section

    attr_accessor :relationship_to_insured, :status, :condition

  end
end
