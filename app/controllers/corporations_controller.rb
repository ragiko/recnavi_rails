class CorporationsController < ApplicationController
  before_action :sign_in_required
  
  def new
    @corporation = current_user.resister_corporations.build
  end

  def index
  end

  def create
    @corp = current_user.resister_corporations.build(corp_params)
    if @corp.save
      redirect_to @corp, notice: '作成しました'
    else
      render :new
    end
  end

  private
  
  def corp_params
    params.require(:corporation).permit(
        :recnavi_id
    )
  end
end
