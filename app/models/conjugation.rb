require 'unicode_utils/downcase'

class Conjugation < ActiveRecord::Base
  default_scope :order => 'verb'

  word_format = /\A[[:word:]]+[' ]?[[:word:]]*\z/
  
  @person_fr = {first_singular: 'Je', second_singular: 'Tu', third_singular: 'Il',
                first_plural: 'Nous', second_plural: 'Vous', third_plural: 'Ils'}
  class << self
    attr_reader :person_fr
  end
  
  before_validation :strip_and_downcase
  
  validates :verb, uniqueness: { scope: :tense, message: 'already has this tense'}
  validates :verb, :tense, 
            :first_singular, :second_singular, :third_singular, 
            :first_plural, :second_plural, :third_plural, 
            presence: true
  validates_format_of :verb, :tense, 
                      :first_singular, :second_singular, :third_singular, 
                      :first_plural, :second_plural, :third_plural, 
                      with: word_format,
                      message: 'accepts only characters, apostrophes and spaces'
  def self.random
    if count > 0
      first(offset: rand(count))
    else
      nil
    end
  end


  private
  def strip_and_downcase
    attributes.each do |attr, value|
      if !value.nil? and (attr.match('verb') || attr.match('tense') || 
                          attr.match('singular') || attr.match('plural')) 
        self[attr] = UnicodeUtils.downcase(value.strip)
      end
    end
  end
end
