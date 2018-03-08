class TransitionFunction
	attr_accessor :rules 

	def initialize(rules)
		@rules = rules
	end

	def next_state(state, symbol)
		rule_for?(state, symbol).follow 
	end

	def rule_for?(state, symbol)
		rules.detect { |rule| rule.applies_to?(state, symbol) }
	end

	class DFARule
		attr_reader :state, :symbol, :next_state

		def initialize(state, symbol, next_state)
			@state = state
			@symbol = symbol
			@next_state = next_state 
		end

		def applies_to?(state, symbol)
			@state == state and @symbol == symbol
		end

		def follow
			next_state 
		end
	end
end

