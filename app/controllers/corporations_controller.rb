class CorporationsController < ApplicationController
  before_action :sign_in_required
  
  def new
    @corporation = current_user.resister_corporations.build
  end

  def index
  end

  def create
    company = Recnavi::Company.new(corp_params[:recnavi_id])
    if company.top_doc.nil? or company.name == ""
      # TODO: 上手くflashをセットできない
      return redirect_to alert: '企業が存在しません', action: "new"
    end
    
    seminar_url = company.event_link.nil? ? nil : company.event_link
    schedule_html = company.schedule_htmls.size == 0 ? nil : company.schedule_htmls.join("")
    # どちらかがnilだった場合、情報を追加しない
    if seminar_url.nil? or schedule_html.nil?
      p seminar_url
      p schedule_html
      seminar_url = nil
      schedule_html = nil
    end
    
    corp = Corporation.new(
        recnavi_id: corp_params[:recnavi_id],
        name: company.name,
        seminar_url: seminar_url,
        schedule_html: schedule_html)
    if corp.save
      redirect_to notice: '作成しました', action: "index"
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
