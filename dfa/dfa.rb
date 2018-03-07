class DFA 
	attr_accessor :current_state, :final_states, :tf

	def initialize(current, finals, tf)
		@current_state = current
		@final_states = finals
		@tf = tf
	end

	def accepting?
		final_states.include? current_state
	end

	def read_string(str)
		str.chars.each do |s|
			read_symbol s
		end
	end
	
	def read_symbol(symbol)
		@current_state = tf.next_state(@current_state, symbol)
	end
end

