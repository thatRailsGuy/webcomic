atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @comics.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url comic_url(item)
      entry.title item.title
      entry.summary item.description
      
      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

    end
  end
end