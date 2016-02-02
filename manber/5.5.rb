require 'pp'
require 'byebug'
Person = Struct.new(:name, :knowings) do
  def know?(another_name)
    knowings.include? another_name
  end
end

def generate_people(ppl_size)
  people = []
  ppl_size.times do |i|
    knowings = (1..i+1).to_a.sample(rand(ppl_size))
    people << Person.new(i+1, knowings)
  end
  people
end

def find_candidate(people)
  if people.size < 2
    return people.first
  end
  a, b = people.sample(2)
  rejecting = a.know?(b.name) ? a : b
  find_candidate(people - [rejecting])
end

def test_candidate(candidate, people)
  (people - [candidate]).all? do |audience|
    audience.know?(candidate.name) &&
    !candidate.know?(audience.name)
  end
end

party_times = 1000
people_size = 20
party_times.times do |i|
  people = generate_people(people_size)
  candidate = find_candidate(people)
  if test_candidate(candidate, people)
    puts "#{i+1}回目のパーティーにて..."
    puts "セレブが見つかった！#{candidate} パーティーの規模#{people_size}人"
    break
  end
  puts "#{i+1}回やっても、セレブは見つけられなかった。。 パーティーの規模#{people_size}人" if i == party_times - 1
end
