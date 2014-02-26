module Cms1500
  class Form
    attr_accessor :output, :line_items

    def initialize(options = {}, &block)
      @output = options.fetch(:output, $stdout)
      @line_items = []
      yield self if block_given?
    end

    def build_section(section, &block)
      send(section, &block)
    end

    def build_line(number, &block)
      line_items << LineItem.new(number, &block)
    end

    def carrier(&block)
      @carrier ||= Carrier.new(&block)
    end

    def patient(&block)
      @patient ||= Patient.new(&block)
    end

    def insured(&block)
      @insured ||= Insured.new(self_insured_options, &block)
    end

    def other_insured(&block)
      @other_insured ||= OtherInsured.new(&block)
    end

    def physician(&block)
      @physician ||= Physician.new(&block)
    end

    def sections
      [carrier, patient, insured, other_insured, physician, line_items].flatten
    end

    def to_text
      if valid?
        text = Text.new(self)
        output.puts(text.content)
      else
        print_validation_messages
      end
    end

    def to_pdf
      raise NotImplementedError
    end

    def valid?
      sections.all?(&:valid?)
    end

    def print_validation_messages
      sections.each do |section|
        next if section.valid?
        puts "[#{ section.class }]"
        section.errors.full_messages.each { |msg| puts msg }
      end
    end

    def self_insured_options
      if patient.relationship_to_insured == :self
        Person.attributes.inject({}) do |options, attribute|
          options[attribute] = patient.send(attribute)
        end
      else
        {}
      end
    end
  end
end
