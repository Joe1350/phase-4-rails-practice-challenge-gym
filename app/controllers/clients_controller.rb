class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        clients = Client.all
        render json: clients, include: :memberships
    end

    def show
        client = Client.find(params[:id])
        render json: client, include: :memberships
    end

    private

    def client_params
        params.permit(:id, :name, :age)
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

end
