module Api
  module V1
    class AppliesController < ApplicationController
      before_action :set_apply, only: [:show, :update, :destroy]

      def index
        @applies = Apply.all
        @applies = @applies.where(read: params[:read]) if params[:read].present?
        @applies = @applies.where(invited: params[:invited]) if params[:invited].present?
        render json: @applies
      end

      def show
        render json: @apply
      end

      def create
        @apply = Apply.new(apply_params)
        if @apply.save
          render json: @apply, status: :created
        else
          render json: { errors: @apply.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @apply.update(apply_params)
          render json: @apply
        else
          render json: { errors: @apply.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @apply.destroy
        render json: { deleted_apply: @apply, code: 200, status: :success }
      end

      private

      def set_apply
        @apply = Apply.find(params[:id])
      end

      def apply_params
        params.require(:apply).permit(:job_id, :geek_id, :read, :invited)
      end
    end
  end
end