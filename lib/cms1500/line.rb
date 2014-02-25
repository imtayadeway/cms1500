module Cms1500
  class Line
    attr_accessor :form, :boxes

    def initialize(form, boxes = [])
      @form = form
      @boxes = boxes
    end

    def content
      boxes.inject('') do |str, box|
        str << "\s" * (box[:indent] - str.length)
        object, attribute = box[:source].split('.')
        str << form.send(object).send(attribute)
        str
      end
    end
  end
end 
