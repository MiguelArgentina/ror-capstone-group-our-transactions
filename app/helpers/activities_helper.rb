module ActivitiesHelper
  def activities_title
    @activity_form_title = if params[:ungrouped]
                             'External activities listing'
                           else
                             'Activities listing'
                           end
  end

  def icon_url_for_activity_show
    @groups.nil? ? 'groups/noicon.png' : "groups/#{@groups.icon}"
  end

  def icon_url_for_activity_index(activity)
    activity.group.nil? || activity.group.icon.nil? ? 'groups/noicon.png' : "groups/#{activity.group.icon}"
  end

  def group_icon_div_text
    @groups.nil? ? 'No group' : @groups.name
  end

  def load_text_or_select(form)
    if params[:add_activity] || action_name == 'edit'
      render 'activities/textlabel_for_names', f: form
    else
      render 'activities/select_with_names', f: form
    end
  end

  def load_new_activity_icon
    render 'activities/load_new_activity_icon' if params[:add_activity].nil? && action_name != 'edit'
  end
end
