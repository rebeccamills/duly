story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
  'Fry encounters his grandmother, then inadvertently sires his father'
]
puts "Should we continue? (y/n)"

i = 0
while i < 6
	puts "#{story[i]}"
	puts "Should we continue? (y/n)"
	response = gets.chomp.downcase
	if response == "n"
		break
	elsif response == "y"
	else
		puts "you didn't respond with y or n, you get no more story."
		break
	end 
	i += 1
	if i == 5
		i = 0
	end 
end
