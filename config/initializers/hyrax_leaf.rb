Hyrax.config do | config |
  
  # Middleware changes
  Hyrax::CurationConcern.actor_factory.swap(Hyrax::Actors::CreateWithFilesActor, 
    Hyrax::Actors::CreateWithFilesOrderedMembersActor)

  Hyrax::CurationConcern.actor_factory.swap(Hyrax::Actors::CreateWithRemoteFilesActor, 
    Hyrax::Actors::CreateWithRemoteFilesOrderedMembersActor)

  # Paths
  config.upload_path = ->() { ENV.fetch('UPLOADS_PATH', File.join(Rails.root, 'tmp', 'uploads/')) }
  config.cache_path = ->() { ENV.fetch('CACHE_PATH', File.join(Rails.root, 'tmp', 'uploads', 'cache')) }
  config.derivatives_path = ENV.fetch('DERIVATIVES_PATH', File.join(Rails.root, 'tmp', 'derivatives'))
  config.working_path = ENV.fetch('WORKING_PATH', File.join(Rails.root, 'tmp', 'uploads'))
  config.branding_path = ENV.fetch('BRANDING_PATH', Rails.root.join('public', 'branding'))
  config.fits_path = 'fits'
  
  # Other config
  config.banner_image = ENV['BANNER'] if ENV['BANNER']
  config.geonames_username = ENV.fetch('GEONAMES_USERNAME', 'hykuleaf')
  config.iiif_image_server = true
  
  config.contact_email = ENV['CONTACT_EMAIL'] if ENV['CONTACT_EMAIL']
  
  config.iiif_image_server = false

  # Returns a URL that resolves to an image provided by a IIIF image server
  config.iiif_image_url_builder = lambda do |file_id, base_url, size|
    "#{base_url}/downloads/#{file_id.split('/').first}"
  end

  # config.iiif_image_compliance_level_uri = 'http://iiif.io/api/image/2/level2.json'

  # Returns a IIIF image size default
  # config.iiif_image_size_default = '600,'

  # Fields to display in the IIIF metadata section; default is the required fields
  # config.iiif_metadata_fields = Hyrax::Forms::WorkForm.required_fields
  
end