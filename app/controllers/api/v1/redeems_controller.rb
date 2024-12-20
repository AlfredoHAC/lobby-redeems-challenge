# frozen_string_literal: true

module Api
  module V1
    class RedeemsController < ApiController
      def create
        @redeem = Redeem.new(redeem_params)

        if @redeem.save
          render json: @redeem, status: :created
        else
          render json: { errors: @redeem.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def redeem_params
        params.require(:redeem)
              .permit(
                :status,
                :redeem_page_id,
                :redeemer_name,
                :redeemer_email,
                :redeemer_document_number,
                :redeemer_zipcode,
                :redeemer_street,
                :redeemer_number,
                :redeemer_neighborhood,
                :redeemer_city,
                :redeemer_state,
                :redeemer_country,
                :redeemer_phone
              )
      end
    end
  end
end
