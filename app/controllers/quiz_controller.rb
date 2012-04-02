class QuizController < ApplicationController

  def index
    @conjugation = Conjugation.random
    @person_key = Conjugation.person_fr.keys.sample
    @person_pronoun = Conjugation.person_fr[@person_key]
    flash[:conjugation] = @conjugation
    flash[:person] = @person_key
  end

  def eval
    conjugation = flash[:conjugation]
    person = flash[:person]
    if params[:quiz_text_field] == conjugation[person]
      flash[:eval] = :correct
    else
      flash[:eval] = :incorrect
      flash[:answer] = conjugation[person]
    end
    redirect_to action: "index"
  end
end
