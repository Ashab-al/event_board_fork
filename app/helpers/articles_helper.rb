module ArticlesHelper
  def events_for_select
    Event.all.collect { |e| [e.title, e.id] }
  end
end
