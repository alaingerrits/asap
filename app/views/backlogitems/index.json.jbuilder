json.array!(@backlogitems) do |backlogitem|
  json.extract! backlogitem, :id, :name, :description, :size, :targetdate
  json.url backlogitem_url(backlogitem, format: :json)
end
