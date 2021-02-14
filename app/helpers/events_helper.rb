module EventsHelper

    def format_date(date)
        date.strftime("%b %d, %Y")
    end

    def format_time(time)
        time.strftime("%l:%M %p")
    end

    def display_category_fields(t)
        if params[:category_id]
            t.hidden_field :category_id
        else
            render partial: 'category_select', locals: {f: t}
        end 
    end 

end
