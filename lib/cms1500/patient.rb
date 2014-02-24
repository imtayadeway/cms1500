module Cms1500
  class Patient
    attr_accessor :output, :first_name, :last_name, :middle_initial

    def initialize(output, &block)
      @output = output
      yield self if block_given?
    end
  end
end
