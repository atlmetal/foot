class HealthController < ApplicationController
  def health
    #renderisa como json el objeto health con el estado OK
    render json: { api: 'OK' }, status: :ok
  end
end