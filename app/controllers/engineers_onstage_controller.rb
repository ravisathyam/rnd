class EngineersOnstageController < ApplicationController
  def index
    @features = EosFeature.all
  end

  def itunes_index
    @features = EosFeature.find(:all, :order => 'content_date DESC', :limit => 10)
    
    respond_to do |format|
      format.xml
    end
  end

  def show
    @feature = params[:id].to_i != 0 ? EosFeature.find(params[:id]) :
      EosFeature.find_by_slug(params[:id])

    respond_to do |format|
      format.html
    end
  end
end
