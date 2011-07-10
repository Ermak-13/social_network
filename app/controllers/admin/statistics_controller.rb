class Admin::StatisticsController < Admin::BaseAdminController
  
  def show
    respond_to do |format|
      format.html
      format.json do
        render :json => Statistics.get_chart_data
      end
    end
  end

end