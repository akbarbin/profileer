require 'rails_helper'

RSpec.describe "Api::V1::Stats", type: :request do
  describe "GET /index" do
    before do
      Services::Stats::Get.new
    end

    it "returns http success" do
      get api_v1_stats_url, as: :json
      expect(response).to have_http_status(:success)
    end
  end

end
