require 'net/http'
require 'json'

namespace :db do
  desc "Fill the database with data from the Earthquake API"
  task seed: :environment do
    url = URI("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    data['features'].each do |feature|
      external_id = feature['id']
      properties = feature['properties']
      geometry = feature['geometry']

      if geometry['coordinates'].nil?
        raise "Invalid data: one or more required fields are nil"
      end
    
      latitude = geometry['coordinates'][1]
      longitude = geometry['coordinates'][0]

      magnitude = properties['mag']

      title = properties['title']
      external_url = properties['url']
      place = properties['place']
      mag_type = properties['magType']

      if latitude.nil? || longitude.nil? || title.nil? || url.nil? || place.nil? || mag_type.nil?
        raise "Invalid data: one or more required fields are nil"
      end

      if latitude < -90.0 || latitude > 90.0
        raise "Invalid latitude: #{latitude}"
      end

      if longitude < -180.0 || longitude > 180.0
        raise "Invalid latitude: #{latitude}"
      end

      unless Earthquake.exists?(external_id: external_id)
      
        Earthquake.create!(
          type: feature['type'],
          external_id: external_id,
          magnitude: magnitude,
          place: place,
          time: properties['time'],
          tsunami: properties['tsunami'],
          mag_type: mag_type,
          title: title,
          longitude: longitude,
          latitude: latitude,
          external_url: external_url
        )
      end
    end
  end
end
