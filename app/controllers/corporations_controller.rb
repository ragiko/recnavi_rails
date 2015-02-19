class CorporationsController < ApplicationController
  before_action :sign_in_required
  
  def new
    @corporation = current_user.resister_corporations.build
  end

  def index
  end

  def create
    
    company = Recnavi::Company.new(corp_params[:recnavi_id])
    # 
    if company.top_doc.nil?
      redirect_to :new, notice: '企業が存在しません'
    end
    # company.top_doc.nil?
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
