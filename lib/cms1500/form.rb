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

      attrs = [:last_name, :first_name, :middle_initial]
      text = attrs.map { |a| @patient.send(a) }.join(', ')

      output.puts(text)
    end
  end
end
