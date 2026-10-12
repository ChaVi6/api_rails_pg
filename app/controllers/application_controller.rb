class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {
      error: 'No such record in Database; check params',
      status: :not_found
    }, status: :not_found
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error "Routing error occurred: #{exception}"
    render json: {
      error: 'No route matches; check routes',
      status: :no_route
    }, status: :not_found
  end

  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end
end