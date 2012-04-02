# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

verbs_file = File.new('db/verbs.txt', 'r')
while( line = verbs_file.gets )
  line = line.split(', ')
  Conjugation.create( verb: line[0], tense: line[1], first_singular: line[2],
                      second_singular: line[3], third_singular: line[4],
                      first_plural: line[5], second_plural: line[6], 
                      third_plural: line[7] )
end
