require_relative 'train.rb'

class PassangerTrain < Train
  def add_carriages(carriage)
    validate_carriage(carriage)
    @carriages.push(carriage)
  end

  protected

  def validate_carriage(carriage)
    raise 'Speed should be 0' if speed != 0
    raise 'Carriage should be Cargo' if carriage.is_a?(PassangerCarriage) != true

    true
  end
end
