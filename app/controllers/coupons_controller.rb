class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def new
  end

  def create
    @coupon = Coupon.new
    @coupon[:coupon_code] = coupon_code_params
    @coupon[:store] = coupon_store_params

    if @coupon.save
      redirect_to coupon_path(@coupon)
    else
      render "new"
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

    private
  #   # Using a private method to encapsulate the permissible parameters is
  #   # a good pattern since you'll be able to reuse the same permit
  #
    def coupon_code_params
      params.require(:coupon).permit(:coupon, :coupon_code)
    end

    def coupon_store_params
      params.require(:coupon).permit(:store)
    end
  #

end
