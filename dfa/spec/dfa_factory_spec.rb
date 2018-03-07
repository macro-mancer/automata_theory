require_relative '../dfa_factory.rb'
require_relative '../dfa.rb'
require_relative '../transition_function.rb'

RSpec.describe DFAFactory do
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
	let(:dfa_factory) { DFAFactory.new(:q0, [:qf], tf) }

	it "should create DFAs" do 
		expect(dfa_factory.to_dfa).to be_a DFA
	end

	it "should be able to check when a DFA accepts a given string" do 
		expect(dfa_factory.accepts?('aaa')).to be_truthy
	end
end

