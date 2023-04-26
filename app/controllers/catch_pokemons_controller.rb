class CatchPokemonsController < ApplicationController
  before_action :set_sequence, only: :create

  def index; end

  def create
    response = CatchPokemonService.new(@sequence).perform

    if response[:status] == :ok
      @pokemon_caught = response[:pokemon_caught]
      @movements = response[:movements]
      render :index
    else
      redirect_to catch_pokemons_path, notice: errors_factory(response[:status])
    end
  end

  private

  def set_sequence
    @sequence = catch_pokemons_params[:sequence]
  end

  def catch_pokemons_params
    params.permit(:sequence)
  end

  def errors_factory(error)
    errors_mapping = {
      no_sequence: 'Não introduziste uma sequência!',
      invalid_sequence: 'A sequência introduzida não é válida!'
    }

    errors_mapping[error]
  end
end
