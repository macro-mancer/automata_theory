require_relative '../transition_function.rb'

RSpec.describe TransitionFunction do
	let(:tf) {
		TransitionFunction.new([
			TransitionFunction::DFARule.new(:q0, :a, :q1), 
			TransitionFunction::DFARule.new(:q0, :b, :q2), 
			TransitionFunction::DFARule.new(:q1, :b, :q2), 
			TransitionFunction::DFARule.new(:q1, :a, :qf), 
			TransitionFunction::DFARule.new(:q2, :a, :q1), 
			TransitionFunction::DFARule.new(:q2, :b, :qf)])
	}

	it "given a state and a symbol, it should be able to determine the next state of a DFA" do 
		expect(tf.next_state(:q0, :a)).to eq(:q1)
		expect(tf.next_state(:q1, :b)).to eq(:q2)
		expect{ tf.next_state(:q1, :c) }.to raise_error(NoMethodError)
	end

	it "should be able to determine whether there's a rule for a given state, symbol pair" do 
		expect(tf.rule_for?(:q0, :a)).to be_truthy
		expect(tf.rule_for?(:q0, :c)).to be_falsey #no such transition
	end
end

