module Cms1500
  class Text
    attr_accessor :content, :elements, :form

    def initialize(form)
      @form = form
      @content = ''
      config = File.open(File.join(File.dirname(__FILE__), 'elements.yml'))
      @elements = YAML.load_file(config).map { |el| Element.new(form, el) }
      generate
    end

    def generate
      (1..93).each do |line|
        if elements.any? { |e| e.line == line }
          content << compose_line(elements.select { |e| e.line == line })
        else
          add_new_line
        end
      end
    end

    def add_new_line
      content << "\n"
    end

    def compose_line(els)
      els.sort.inject('') do |str, element|
        str += ("\s" * (element.ljust - str.length - 1)) + element.text
      end
    end
  end
end
