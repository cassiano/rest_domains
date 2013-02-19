class HealthCheckController < ApplicationController
  def alive
    status = ActiveRecord::Base.connection.active? ? :ok : :service_unavailable

    head status
  end
end