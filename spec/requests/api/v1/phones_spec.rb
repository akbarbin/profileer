require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/api/v1/phones", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Phone. As you add validations to Phone, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { number: 14152007986 }
  }

  let(:invalid_attributes) {
    { number: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PhonesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Phone.create! valid_attributes
      get api_v1_phones_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /validate" do
    context "with valid parameters" do
      it "renders a successful response" do
        phone = Phone.create! valid_attributes
        get validate_api_v1_phones_url, params: { number: valid_attributes[:number] }, as: :json
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the new phone" do
        phone = Phone.create! valid_attributes
        get validate_api_v1_phones_url, params: { number: invalid_attributes[:number] }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      phone = Phone.create! valid_attributes
      get api_v1_phone_url(phone), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Phone" do
        expect {
          post api_v1_phones_url,
               params: { phone: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Phone, :count).by(1)
      end

      it "renders a JSON response with the new phone" do
        post api_v1_phones_url,
             params: { phone: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Phone" do
        expect {
          post api_v1_phones_url,
               params: { phone: invalid_attributes }, as: :json
        }.to change(Phone, :count).by(0)
      end

      it "renders a JSON response with errors for the new phone" do
        post api_v1_phones_url,
             params: { phone: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { number: 6233333333333 }
      }

      it "updates the requested phone" do
        phone = Phone.create! valid_attributes
        patch api_v1_phone_url(phone),
              params: { phone: new_attributes }, headers: valid_headers, as: :json
        phone.reload
        expect(phone.number).to eq(new_attributes[:number].to_i)
      end

      it "renders a JSON response with the phone" do
        phone = Phone.create! valid_attributes
        patch api_v1_phone_url(phone),
              params: { phone: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the phone" do
        phone = Phone.create! valid_attributes
        patch api_v1_phone_url(phone),
              params: { phone: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested phone" do
      phone = Phone.create! valid_attributes
      expect {
        delete api_v1_phone_url(phone), headers: valid_headers, as: :json
      }.to change(Phone, :count).by(-1)
    end
  end
end
