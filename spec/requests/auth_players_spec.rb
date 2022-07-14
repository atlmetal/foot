require "rails_helper"

RSpec.describe "Player with authentication", type: :request do
  let!(:club) { create(:club) }
  let!(:other_club) { create(:club) }
  let!(:club_player) { create(:player, club_id: club.id) }
  let!(:other_club_player) { create(:player, club_id: other_club.id) }
  let!(:auth_headers) { { 'Authorization' => "Bearer #{club.auth_token}" } }
  let!(:other_auth_headers) { { 'Authorization' => "Bearer #{other_club.auth_token}" } }

  # Authorization: Bearer <token>

  #endpoint detalle
  describe "GET /players{id}" do
    context 'with valid auth' do
      context "when requisting other's players from others club" do
        before { get "/players/#{other_club_player.id}", headers: auth_headers }

        context "payload" do
          #validacion al payload
          subject { payload }
          xit { is_expected.to include(:id)}
        end
        context "response" do
          #al response
          subject { response }
          xit { is_expected.to have_http_status(:ok) }
        end
      end
      context "when requisting other's club player" do
      end
    end
  end
  #endpoint creacion
  describe "POST /players" do
  end
  #endpoint actualizacion
  describe "PUT /players" do
  end

  private

  def payload
    JSON.parse(response.body).with_indifferent_access
  end
    # it "returns OK" do
    #   get '/players'
    #   payload = JSON.parse(response.body)
    #   expect(payload).to be_empty
    #   expect(response).to have_http_status(200)
    # end
  # end
end
