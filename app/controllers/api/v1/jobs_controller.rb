module Api
  module V1
    class JobsController < ApplicationController
      before_action :set_job, only: [:show, :update, :destroy]

      def index
        if params[:company_id]
          @jobs = Company.find(params[:company_id]).jobs
        else
          @jobs = Job.all
        end
        render json: @jobs
      end

      def show
        render json: @job
      end

      def create
        @job = Job.new(job_params)
        if @job.save
          render json: @job, status: :created
        else
          render json: { errors: @job.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @job.update(job_params)
          render json: @job
        else
          render json: { errors: @job.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @job.destroy
        render json: { deleted_job: @job, code: 200, status: :success }
      end

      private

      def set_job
        @job = Job.find(params[:id])
      end

      def job_params
        params.require(:job).permit(:name, :place, :company_id)
      end
    end
  end
end