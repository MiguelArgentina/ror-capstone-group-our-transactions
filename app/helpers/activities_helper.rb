module ActivitiesHelper
  def activities_title
    @activity_form_title = if params[:ungrouped]
                             'External activities listing'
                           else
                             'Activities listing'
                           end
  end
end
