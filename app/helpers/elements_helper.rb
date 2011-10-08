module ElementsHelper
  def javascript_files
    uses_kmaps_integration ? super + ['jquery.autocomplete', 'jquery.checktree', 'model-searcher', 'jquery.draggable.popup', 'ui-handler'] : super + ['ui-handler']
  end
  
  def stylesheet_files
    ['index'].include?(params[:action]) ? super + ['jquery-ui'] : super
  end
  
    
  private
  
  def uses_kmaps_integration
    ['index', 'new', 'edit'].include? params[:action]
  end
end