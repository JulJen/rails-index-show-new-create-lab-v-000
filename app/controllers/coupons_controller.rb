class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def new
  end

  def create
    @coupon = Coupon.new
    @coupon[:coupon_code] = params[:coupon][:coupon_code]
    @coupon[:store] = params[:coupon][:store]

    if @coupon.save
      redirect_to coupon_path(@coupon)
    else
      render "new"
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  #   private
  #   # Using a private method to encapsulate the permissible parameters is
  #   # a good pattern since you'll be able to reuse the same permit
  #
  #   def coupon_params
  #     params.require(:coupon).permit(:coupon_code, :store)
  #   end
  #

end
