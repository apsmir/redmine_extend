Redmine::Plugin.register :redmine_extend do
  name 'Redmine Extend plugin'
  author 'Alexey Smirnov'
  description 'This is a plugin for Redmine, extend permissions '
  version '0.0.1'
  url 'https://github.com/apsmir/redmine_extend'
  author_url 'https://github.com/apsmir'

  Redmine::AccessControl.map do |map|
    map.project_module :issue_tracking do |map|
      map.permission :edit_assigned_issues, {:issues => [:edit, :update, :bulk_edit, :bulk_update], :journals => [:new], :attachments => :upload}
    end
  end
end

require_dependency File.dirname(__FILE__) + '/lib/redmine_extend'
