require_relative 'dfa' 

class DFAFactory
	attr_reader :start_state, :final_states, :tf 

	def initialize(start, finals, trans_function)
		@start_state = start
		@final_states = finals
		@tf = trans_function
	end

	def to_dfa
		DFA.new(start_state, final_states, tf)
	end

	def accepts?(str)
		to_dfa.tap { |dfa| dfa.read_string(str) }.accepting?
	end
end
