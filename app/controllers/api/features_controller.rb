class Api::FeaturesController < ApplicationController
  before_action :set_earthquake, only: [:show]

  def index
    @page = (params[:page] || 1).to_i
    @per_page = (params[:per_page] || 10).to_i

    valid_elements = ['md', 'ml', 'ms', 'mw', 'me', 'mi', 'mb', 'mlg']
    array_to_check =  params[:mag_type].nil? ? nil : params[:mag_type].split(',')

    if @per_page < 1 || @per_page > 1000

      render json: { error: 'per_page should be more than 1 and no more than 1000' }, status: :bad_request
      return

    elsif array_to_check.nil? || array_to_check.all? { |element| valid_elements.include?(element) }

      if params[:mag_type]
        @earthquakes = Earthquake.where(mag_type: array_to_check).paginate(page: @page, per_page: @per_page)
      else
        @earthquakes = Earthquake.all.paginate(page: @page, per_page: @per_page)
      end

      render :index, status: :ok
      return

    else
      render json: { error: 'mag_type only shoul be: [md, ml, ms, mw, me, mi, mb, mlg]' }, status: :bad_request
      return
    end
  end

  def show
    if @earthquake.nil?
      render json: { error: 'Earthquake not found' }, status: :not_found
    else
      render :show, status: :ok
    end
  end

  private

  def set_earthquake
    @earthquake = Earthquake.find_by(id: params[:id])
    render json: { error: 'Earthquake not found' }, status: :not_found unless @earthquake
  end
end
