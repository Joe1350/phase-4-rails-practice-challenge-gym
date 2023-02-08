class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        gyms = Gym.all
        render json: gyms, include: :clients
    end

    def show
        gym = find_gym
        render json: gym, include: :clients
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:id, :name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
