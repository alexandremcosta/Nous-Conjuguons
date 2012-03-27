require 'unicode_utils/downcase'

class Conjugation < ActiveRecord::Base
  word_format = /\A[[:word:]]+[' ]?[[:word:]]*\z/

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

  private
  def strip_and_downcase
    self.attributes.each do |attr, value|
      if !value.nil? and (attr.match('verb') || attr.match('tense') || attr.match('singular') || attr.match('plural')) 
        self[attr] = UnicodeUtils.downcase(value.strip)
      end
    end
  end
end
