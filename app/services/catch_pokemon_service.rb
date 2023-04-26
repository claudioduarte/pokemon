class CatchPokemonService
  ALLOWED_DIRECTIONS = %w[N S E O W]

  def initialize(sequence)
    @sequence = sequence
    @pokemon_caught = 1
    @x = 0
    @y = 0
    @initial_coordinates = {x: @x, y: @y}
  end

  def perform
    return { status: :no_sequence } unless @sequence.present?

    return { status: :invalid_sequence } unless allowed_directions?

    return { status: :ok, pokemon_caught: @pokemon_caught, movements: movements } if execute_sequence
  end

  private

  def allowed_directions?
    split_sequence.each do |direction|
      break unless ALLOWED_DIRECTIONS.include?(direction)
    end
  end

  def execute_sequence
    split_sequence.each_with_index.map do |direction, index|
      case direction
      when 'N' then @y += 1
      when 'S' then @y -= 1
      when 'E' then @x -= 1
      when 'O' then @x += 1
      when 'W' then @x += 1
      end

      duplicate_coordinates? ? @pokemon_caught += 0 : @pokemon_caught += 1

      register_movement(direction, index)
    end
  end

  def split_sequence
    @split_sequence ||= @sequence.upcase.split(//)
  end

  def duplicate_coordinates?
    movements.any?{|m| m[:coordinates] == {x: @x, y: @y} }
  end

  def register_movement(direction, index)
    movements.push(
      {
        position: index + 1,
        direction: direction,
        pokemon: @pokemon_caught,
        coordinates: {x: @x, y: @y}
      }
    )
  end

  def movements
    @movements ||= [{
      position: 0,
      direction: 'start',
      pokemon: @pokemon_caught,
      coordinates: @initial_coordinates
    }]
  end
end