module Cms1500
  class Element
    extend Forwardable

    def_delegators :@form, :carrier, :patient, :insured, :other_insured,
      :physician, :lines

    attr_accessor :form, :name, :type, :source, :coords

    def initialize(form, options = {})
      @form = form
      @coords = options.fetch(:coords, [])
      @name = options.fetch(:name, nil)
      @type = options.fetch(:type, :text)
      @source = options.fetch(:source, nil)
    end

    def checkbox?
      type == :checkbox
    end

    def text?
      type == :text
    end

    def text
      text? ? value.to_s : 'X'
    end

    def line
      parse_coords(:first)
    end

    def ljust
      parse_coords(:last)
    end

    def parse_coords(item)
      case
      when text? then coords.send(item)
      when checkbox? then coords[value].send(item)
      end
    end

    def value
      object, attribute = source.split('.')
      send(object).send(attribute)
    end

    def <=>(other)
      [line, ljust] <=> [other.line, other.ljust]
    end
  end
end
