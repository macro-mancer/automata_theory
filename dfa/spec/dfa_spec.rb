require_relative '../dfa.rb'
require_relative '../transition_function.rb'

RSpec.describe DFA do
	let(:dfa) { DFA.new(anything, anything, anything) }

	it "should be able to read one symbol at a time" do 
		expect(dfa).to respond_to(:read_symbol)
	end

	it "should be able to read strings" do
		expect(dfa).to respond_to(:read_string)
	end
	
	context "after processing a string" do
		let(:tf) {
			tf = TransitionFunction.new([
				TransitionFunction::DFARule.new(:q0, 'a', :q1), 
				TransitionFunction::DFARule.new(:q0, 'b', :q2), 
				TransitionFunction::DFARule.new(:q1, 'b', :q2), 
				TransitionFunction::DFARule.new(:q1, 'a', :qf), 
				TransitionFunction::DFARule.new(:q2, 'a', :q1), 
				TransitionFunction::DFARule.new(:q2, 'b', :qf),
				TransitionFunction::DFARule.new(:qf, 'b', :qf),
				TransitionFunction::DFARule.new(:qf, 'a', :qf)])
		}

		it "should be able to signal whether the string was accepted" do 
			dfa_1 = DFA.new(:q0, [:qf], tf)
			dfa_1.read_string('ababba')
			expect(dfa_1.accepting?).to be_truthy
		end
	end
end

