class Api::V1::StatsController < ApplicationController
  skip_before_action :authorize_request, only: :index

  def index
    @service = Services::Stats::Get.new
  end
end
