module Cms1500
  class Form
    attr_accessor :output

    def initialize(options = {}, &block)
      @output = options.fetch(:output, $stdout)
      yield self if block_given?
    end

    def build_section(section, &block)
      send(section, &block)
    end

    def patient(&block)
      @patient ||= Patient.new(output, &block)
    end

    def carrier(&block)
      @carrier ||= Carrier.new(output, &block)
    end

    def insured(&block)
      @insured ||= Insured.new(output, &block)
    end

    def other_insured(&block)
      @other_insured ||= OtherInsured.new(output, &block)
    end

    def physician(&block)
      @physician ||= Physician.new(output, &block)
    end

    def print
      output.puts(patient.name)
    end

    def to_pdf
      #
    end
  end
end
