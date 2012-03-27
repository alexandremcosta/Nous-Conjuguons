#encoding: utf-8
require 'test_helper'

class ConjugationTest < ActiveSupport::TestCase
  test "conjugations atributes must not be empty" do
    c = Conjugation.new
    assert c.invalid?
    c.attributes.each_key do |attr| 
      assert c.errors[attr].any? if attr.match('verb') || attr.match('tense') || 
                                    attr.match('singular') || attr.match('plural') 
    end
  end

  test "conjugation atributes should validade apostrophed, not striped and not downcased strings" do
    c = Conjugation.new(verb: '  MaNgEr  ', tense: 'manGER  ', first_singular: 'MANGER', 
                        second_singular: 'mángêr', third_singular: 'MÃnGÈR', first_plural: "   M'ÀPPÊLler  ",
                        second_plural: '   MANGẼr  ', third_plural: 'manger')
    assert c.valid?
    assert c[:verb] == 'manger' && c[:first_singular] == 'manger' && 
           c[:third_singular] == 'mãngèr' && c[:first_plural] == "m'àppêller";
  end
end
