require 'darthjee/core_ext'

class Dinner
  attr_reader :experiments, :trials, :miniatures, :repeats

  def initialize(repeats: 1000, experiments: 1000, trials: 1000, miniatures: 3)
    @repeats = repeats
    @experiments = experiments
    @trials = trials
    @miniatures = miniatures
  end

  def average
    Average.new(repeats) { repetition }.average
  end

  private

  def repetition
    Average.new(trials) { trial }.average
  end

  def trial
    Average.new(experiments) { experiment }.average
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
