module GroupsHelper

  def groups_image_url(group)
    group.icon.nil? ? 'groups/noicon.png' : "groups/#{group.icon}"
  end
  
  def groups_image_url_show
    @group.icon.nil? ? 'groups/noicon.png' : "groups/#{@group.icon}"
  end
  def activity_icon_url_in_group_show
    @group.icon.nil? ? 'groups/noicon.png' : 'groups/' + @group.icon
  end

end
