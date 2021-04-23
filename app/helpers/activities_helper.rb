module ActivitiesHelper
  def activities_title
    @activity_form_title = if params[:ungrouped]
                             'External activities listing'
                           else
                             'Activities listing'
                           end
  end

  def icon_url_for_activity_show
    @groups.nil? ? 'groups/noicon.png' : 'groups/' + @groups.icon
  end
  
  def icon_url_for_activity_index(activity)
    activity.group.nil? || activity.group.icon.nil? ? 'groups/noicon.png' : 'groups/' + activity.group.icon
  end

  def group_icon_div_text
    @groups.nil? ? 'No group' : @groups.name
  end
end
