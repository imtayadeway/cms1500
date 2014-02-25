module Cms1500
  class LineItem
    include ActiveModel::Validations
    include Section

    attr_accessor :number, :date_of_service, :emg, :cpt, :modifier,
      :diagnosis_pointer, :charges, :units, :epstd_family_plan,
      :rendering_provider_id

    def initialize(number, &block)
      @number = number
      super(&block)
    end
  end
end
