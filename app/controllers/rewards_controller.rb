class RewardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def calculate
    service = Rewards::Main.new(reward_params[:binary_data])
    respond_to do |format|
      if service.invalid?
        format.json { render json: { errors: service.errors }, status: :unprocessable_entity }
      end

      format.json { render json: service.calculate, status: :ok }
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:binary_data)
  end
end
