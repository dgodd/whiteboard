defimpl Phoenix.HTML.Safe, for: Whiteboard.Kind do
  def to_iodata(kind) do
    kind.name
  end
end

defimpl Phoenix.HTML.Safe, for: Whiteboard.Standup do
  def to_iodata(standup) do
    standup.name
  end
end