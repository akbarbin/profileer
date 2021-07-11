class Api::V1::StatsController < ApplicationController
  def index
    @service = Services::Stats::Get.new
  end
end
