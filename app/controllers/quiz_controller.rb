class QuizController < ApplicationController
  def index
    debugger
    if params[:quiz_text_field]
      @conjugation = flash[:conjugation]
      @person_key = flash[:person]
      unless @conjugation[@person_key] == params[:quiz_text_field]
        flash.keep
        flash[:eval] = :incorrect
        flash[:answer] = @conjugation[@person_key]
        @person_pronoun = Conjugation.person_fr[@person_key]
        return
      else
        flash[:eval] = :correct
      end
    else
      flash.clear
    end
    flash[:conjugation] = @conjugation = Conjugation.random
    flash[:person] = @person_key = Conjugation.person_fr.keys.sample
    @person_pronoun = Conjugation.person_fr[@person_key]
  end
end
