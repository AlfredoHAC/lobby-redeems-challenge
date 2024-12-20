# frozen_string_literal: true

module Api
  module V1
    class RedeemPagesController < ApiController
      before_action :set_resource

      def show
        if @redeem_page.inactive?
          render :json, status: :forbidden
        else
          render json: @redeem_page, include: ['items', 'items.sizes', 'extra_questions']
        end
      end

      private

      def set_resource
        @redeem_page = RedeemPage.find(params[:id])
      end
    end
  end
end
