module Cms1500
  class Box
    attr_accessor :name, :indent, :type, :source

    def initialize(options = {})
      @name = options.fetch(:name, '')
      @indent = options.fetch(:indent, 0)
      @type = options.fetch(:type, :text)
      @source = options.fetch(:source, nil)
    end

    def checkbox?
      type == :checkbox
    end

    def text?
      type == :text
    end
  end
end
