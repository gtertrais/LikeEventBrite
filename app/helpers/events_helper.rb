module EventsHelper
    def organizer
        User.find(@event.user_id)
    end
end
