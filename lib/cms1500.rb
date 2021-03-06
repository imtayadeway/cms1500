require 'active_model'
I18n.enforce_available_locales = false

module Cms1500
  module Section
    def initialize(&block)
      yield self if block_given?
    end

    def persisted?
      false
    end
  end

  class Person
    include ActiveModel::Validations

    validates :first_name,
      presence: true,
      format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :last_name,
      presence: true,
      format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :middle_initial, length: { maximum: 1 }

    validate :valid_sex
    validate :valid_dob

    def self.attributes
      [
        :first_name,
        :last_name,
        :middle_initial,
        :date_of_birth,
        :sex,
        :address,
        :city,
        :state,
        :zip_code,
        :telephone
      ]
    end

    attr_accessor *self.attributes

    def name
      [last_name, first_name, middle_initial].compact.join(', ')
    end

    def valid_sex
      unless [:female, :male].include?(sex)
        errors.add(:sex, "must be female or male")
      end
    end

    def valid_dob
      #
    end
  end

  class InsuredPerson < Person
    attr_accessor :id_number, :group_number, :policy_number, :feca_number,
      :employer_name, :school_name, :plan_name, :program_name

    validates :id_number,
      presence: true,
      numericality: true
  end
end

require 'yaml'
require 'prawn'
require 'cms1500/form'
require 'cms1500/carrier'
require 'cms1500/patient'
require 'cms1500/insured'
require 'cms1500/other_insured'
require 'cms1500/physician'
require 'cms1500/line_item'
require 'cms1500/text'
require 'cms1500/element'

module Cms1500
  def self.build_form(options = {}, &block)
    Form.new(options, &block)
  end
end
