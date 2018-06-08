def cypher(string, shift_factor)
	a=[]
	string.each_byte do |char_ascii|
		# Shift alphabet characters, add the others without modification. 
		if char_ascii.between?(65,90) or char_ascii.between?(97,122)
			a << shift(char_ascii, shift_factor)
		else
			a << char_ascii
		end
	end

	a_encoded=[]
	a.each {|ascii| a_encoded << ascii.chr}

	puts "original: #{string}\nencoded: #{a_encoded.join}"
end

def shift(ascii, shift_factor)
	# Define the first ascii value that requires a character to go from the end to the beginning of the alphabet.
	edge_ascii_value = ascii < 91 ? 90-shift_factor : 122-shift_factor 
	# This is the amount we subract from the ascii value if we have to go from z to a.
	edge_shift_value = 26-shift_factor

	# If we don't go passed z then add the shift value, other wise subtract by the required value. 
	if ascii.between?(65,edge_ascii_value) or ascii.between?(97,edge_ascii_value) 
		return ascii+shift_factor
	else
		return ascii-edge_shift_value
	end
end

def valid_shift_factor?(shift_factor)
	return true if shift_factor.between?(1,26)
end

def get_things
	STDERR.puts 'Enter string to encode: '
	string = gets.chomp

	shift=0
	valid_shift=false
	until valid_shift
		STDERR.puts 'Enter the shift factor: '
		shift = gets.chomp.to_i

		valid_shift = true if shift.between?(1,26) 
		STDERR.puts "Shift value should be between 1 and 25" unless valid_shift
	end
	cypher(string,shift)
end

get_things
