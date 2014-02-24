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

    def print
      output.puts(patient.name)
    end
  end
end
