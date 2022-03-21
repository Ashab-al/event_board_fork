module ArticlesHelper
  def events_for_select(events)
    events.collect { |e| [e.title, e.id] }
  end
end
