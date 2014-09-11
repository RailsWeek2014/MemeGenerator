module ApplicationHelper
    def get_username_from_id id
        if id != nil && User.exists?(:id => id)
        @User = User.find(id)
            @User.username
        else
            'unregistriert'
        end
    end
end
