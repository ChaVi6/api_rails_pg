module Api
  module V1
    class GeeksController < ApplicationController
      before_action :set_geek, only: [:show, :update, :destroy]

      def index
        @geeks = Geek.all
        render json: @geeks
      end

      def show
        render json: @geek
      end

      def create
        @geek = Geek.new(geek_params)
        if @geek.save
          render json: @geek, status: :created
        else
          render json: { errors: @geek.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @geek.update(geek_params)
          render json: @geek
        else
          render json: { errors: @geek.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @geek.destroy
        render json: { deleted_geek: @geek, code: 200, status: :success }
      end

      private

      def set_geek
        @geek = Geek.find(params[:id])
      end

      def geek_params
        params.require(:geek).permit(:name, :stack, :resume)
      end
    end
  end
end