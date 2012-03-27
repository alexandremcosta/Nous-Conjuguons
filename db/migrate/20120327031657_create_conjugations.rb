class CreateConjugations < ActiveRecord::Migration
  def change
    create_table :conjugations do |t|
      t.string :verb
      t.string :tense
      t.string :first_singular
      t.string :second_singular
      t.string :third_singular
      t.string :first_plural
      t.string :second_plural
      t.string :third_plural

      t.timestamps
    end
  end
end
