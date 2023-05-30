class CardDetailsController < ApplicationController
	before_action :authorize_request

	def create
		@card_detail = @current_user.card_details.new(parmit_params)
		if @card_detail.save
      render json: @card_detail, status: :created
    else
      render json: { errors: @card_detail.errors.full_messages },
             status: :unprocessable_entity
    end
	end


	private

	def parmit_params
		params.permit(:card_number, :exp_month, :exp_year, :cvv, :card_type, :user_id)
	end
end
