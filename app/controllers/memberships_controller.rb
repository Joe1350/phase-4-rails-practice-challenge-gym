class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        # if membership_params
        membership = Membership.create(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:id, :gym_id, :client_id, :charge)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
