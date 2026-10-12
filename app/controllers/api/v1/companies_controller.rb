module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :set_company, only: [:show, :update, :destroy, :mark_deleted]

      def index
        # Исключаем soft-deleted компании
        @companies = Company.where(deleted: false)
        render json: @companies
      end

      def show
        render json: @company
      end

      def create
        @company = Company.new(company_params)
        if @company.save
          render json: @company, status: :created
        else
          render json: { errors: @company.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @company.update(company_params)
          render json: @company
        else
          render json: { errors: @company.errors }, status: :unprocessable_entity
        end
      end
      
      def destroy
        @company.destroy
        render json: { deleted_company: @company, code: 200, status: :success }
      end

      def mark_deleted
        if @company.deleted
          render json: {
            deleted_company: [],
            deleted_already: :not_modified
          }, status: :not_modified
        else
          @company.delete_company
          render json: {
            deleted_company: @company.as_json(except: [:created_at, :updated_at]),
            code: 200,
            status: :success
          }
        end
      end

      private

      def set_company
        @company = Company.find(params[:company_id] || params[:id])
      end

      def company_params
        params.require(:company).permit(:name, :location)
      end
    end
  end
end