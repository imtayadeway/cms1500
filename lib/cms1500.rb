require 'cms1500/form'
require 'cms1500/patient'

module Cms1500
  def self.build_form(options = {}, &block)
    Form.new(options, &block)
  end
end
