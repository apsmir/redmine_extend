module RedmineExtend
  module Models
    module IssuePatch
      def attributes_editable?(user=User.current)
        super || (
          user_tracker_permission?(user, :edit_assigned_issues) && assigned_to == user
        )
      end
    end
  end
end

Issue.send(:prepend, RedmineExtend::Models::IssuePatch)