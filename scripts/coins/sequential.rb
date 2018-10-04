require 'darthjee/core_ext'

module Coins
  class Sequential
    attr_reader :experiments, :trials

    def initialize(experiments=10000, trials=10000)
      @experiments = experiments
      @trials = trials
    end

    def average
      trials.times.map do
        trial
      end.average
    end

    private

    def trial
      experiments.times.map do
        experiment
      end.average
    end

    def experiment
      count = 0
      while(head?)
        count = count + 1
      end
      count
    end

    def head?
      Random.rand(2) == 0
    end
  end
end

puts Coins::Sequential.new.average
