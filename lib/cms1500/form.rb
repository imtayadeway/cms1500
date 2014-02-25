module Cms1500
  class Form
    attr_accessor :output, :line_items, :lines

    def initialize(options = {}, &block)
      @output = options.fetch(:output, $stdout)
      @line_items = []
      config = File.open(File.join(File.dirname(__FILE__), 'lines.yml'))
      @lines = YAML.load_file(config).map { |boxes| Line.new(self, boxes) }
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
      @insured ||= Insured.new(&block)
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

    def print
      if valid?
        lines.each do |line|
          output.puts(line.content)
        end
      else
        sections.each do |section|
          next if section.valid?
          puts "[#{ section.class }]"
          section.errors.full_messages.each { |msg| puts msg }
        end
      end
    end

    def to_pdf
      #
    end

    def valid?
      sections.all?(&:valid?)
    end
  end
end
