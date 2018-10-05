require 'darthjee/core_ext'

class Dinner
  attr_reader :experiments, :trials, :miniatures, :repeats

  def initialize(repeats: 1000, experiments: 10000, trials: 10000, miniatures: 3)
    @repeats = repeats
    @experiments = experiments
    @trials = trials
    @miniatures = miniatures
  end

  def average
    repeats.times.map do
      repetition
    end.average
  end

  private

  def repetition
    trials.times.map do
      trial
    end.average
  end

  def trial
    experiments.times.map do
      experiment
    end.average
  end

  def experiment
    Experiment.new(miniatures).result
  end

  class Experiment
    attr_reader :miniatures

    def initialize(miniatures)
      @miniatures = miniatures
    end

    def result
      count = 0
      until(completed?)
        dinner
        count = count + 1
      end
      count
    end

    private

    def dinner
      if (get >= collected)
        @collected = collected + 1
      end
    end

    def get
      Random.rand(miniatures)
    end

    def completed?
      collected == miniatures
    end

    def collected
      @collected ||= 0
    end
  end
end

puts Dinner.new.average
