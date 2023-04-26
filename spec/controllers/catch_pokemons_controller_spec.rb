require 'rails_helper'

RSpec.describe CatchPokemonsController, type: :controller do
  let(:lowercase_valid_sequence) {'nsewo'}
  let(:uppercase_valid_sequence) {'NSEWOOO'}
  let(:empty_sequence) {''}
  let(:invalid_sequence) {'cD42#'}
  let(:valid_sequence) {'NESWO'}

  describe "GET index" do
    it "assigns @pokemon_caught" do
      get :index
      expect(assigns(:pokemon_caught)).to be_nil
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST create" do
    it "returns /index when sequence is lowercase letters" do
      post_request(lowercase_valid_sequence)
      expect(response).to render_template(:index)
    end

    it "returns /index when sequence is uppercase letters" do
      post_request(uppercase_valid_sequence)
      expect(response).to render_template(:index)
    end

    it "returns /catch_pokemons when sequence is empty" do
      post_request(empty_sequence)
      expect(response).to redirect_to(:catch_pokemons)
    end

    it "returns /catch_pokemons when sequence is invalid" do
      post_request(invalid_sequence)
      expect(response).to redirect_to(:catch_pokemons)
    end

    it "assigns @pokemon_caught to zero when invalid sequence" do
      post_request(invalid_sequence)
      expect(assigns(:pokemon_caught)).to be_nil
    end

    it "assigns @pokemon_caught to be >0 when valid sequence" do
      post_request(valid_sequence)
      expect(assigns(:pokemon_caught)).to_not be_zero
    end

    it "assigns @movements" do
      post_request(valid_sequence)
      expect(assigns(:movements)).to be_an_instance_of(Array)
    end
  end

  private

  def post_request(sequence)
    post :create, params: {sequence: sequence}
  end
end
