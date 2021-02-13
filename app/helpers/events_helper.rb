module EventsHelper

    def format_date(date)
        date.strftime("%b %d, %Y")
    end

    def format_time(time)
        time.strftime("%l:%M %p")
    end

end
