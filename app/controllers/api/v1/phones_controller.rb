class Api::V1::PhonesController < ApplicationController
  skip_before_action :authorize_request, only: :validate

  before_action :set_phone, only: %i[ show update destroy ]

  # GET /api/v1/phones
  # GET /api/v1/phones.json
  def index
    @phones = Phone.all
  end

  # GET /api/v1/phones/validate
  # GET /api/v1/phones/validate.json
  def validate
    service = Services::Abstract::Phones::Validate.new(validate_params[:number])

    if service.call
      @phone = service.phone
      render :show, status: :ok, location: api_v1_phone_url(@phone)
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/phones/1
  # GET /api/v1/phones/1.json
  def show
  end

  # POST /api/v1/phones
  # POST /api/v1/phones.json
  def create
    service = Services::Phones::Create.new(phone_params)

    if service.call
      @phone = service.phone
      render :show, status: :created, location: api_v1_phone_url(@phone)
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/phones/1
  # PATCH/PUT /api/v1/phones/1.json
  def update
    if @phone.update(phone_params)
      render :show, status: :ok, location: api_v1_phone_url(@phone)
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/phones/1
  # DELETE /api/v1/phones/1.json
  def destroy
    @phone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phone_params
      params.require(:phone).permit(:number)
    end

    def validate_params
      params.permit(:number)
    end
end
