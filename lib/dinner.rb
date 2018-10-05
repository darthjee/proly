require 'darthjee/core_ext'

class Dinner
  attr_reader :experiments, :trials, :miniatures, :repeats

  def initialize(repeats: 100, experiments: 100, trials: 100, miniatures: 3)
    @repeats = repeats
    @experiments = experiments
    @trials = trials
    @miniatures = miniatures
  end

  def average
    av = Average.new
    repeats.times.map do
      av + repetition
    end
    av.average
  end

  private

  def repetition
    av = Average.new
    trials.times do
      av + trial
    end
    av.average
  end

  def trial
    av = Average.new
    experiments.times do
      av + experiment
    end
    av.average
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
