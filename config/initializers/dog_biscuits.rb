# frozen_string_literal: true

# load dog_biscuits config
DOGBISCUITS = YAML.safe_load(File.read(Rails.root.join('config', 'dog_biscuits.yml'))).with_indifferent_access
# include Terms
Qa::Authorities::Local.register_subauthority('concepts', 'DogBiscuits::Terms::ConceptsTerms')
Qa::Authorities::Local.register_subauthority('projects', 'DogBiscuits::Terms::ProjectsTerms')
Qa::Authorities::Local.register_subauthority('organisations', 'DogBiscuits::Terms::OrganisationsTerms')
Qa::Authorities::Local.register_subauthority('places', 'DogBiscuits::Terms::PlacesTerms')
Qa::Authorities::Local.register_subauthority('people', 'DogBiscuits::Terms::PeopleTerms')
Qa::Authorities::Local.register_subauthority('groups', 'DogBiscuits::Terms::GroupsTerms')
Qa::Authorities::Local.register_subauthority('events', 'DogBiscuits::Terms::EventsTerms')
Qa::Authorities::Local.register_subauthority('departments', 'DogBiscuits::Terms::DepartmentsTerms')

# Configuration
DogBiscuits.config do |config|
  # GLOBAL PROPERTIES

  # Add values that aren't found in the following table-based authorities to be added on save.
  #   This only works in cases where the name of the authority is a pluralized form of
  #   the name of the property which uses it, eg. subjects/subject and languages/language
  # Default is :subjects; add authority name as symbol, eg. :subjects
  # config.authorities_add_new = []

  # Models to be used in the current application.
  #   Available models are: ConferenceItem, Dataset, DigitalArchivalObject, ExamPaper, JournalArticle, Package, PublishedWork, Thesis ConferenceItem, Dataset, DigitalArchivalObject, ExamPaper, JournalArticle, Package, PublishedWork, Thesis ConferenceItem, Dataset, DigitalArchivalObject, ExamPaper, JournalArticle, Package, PublishedWork, Thesis ConferenceItem, Dataset, DigitalArchivalObject, ExamPaper, JournalArticle, Package, PublishedWork, Thesis ConferenceItem, Dataset, DigitalArchivalObject, ExamPaper, JournalArticle, Package, PublishedWork, Thesis ConferenceItem, Dataset, DigitalArchivalObject, ExamPaper, JournalArticle, Package, PublishedWork, Thesis ConferenceItem, ExamPaper, JournalArticle, PublishedWork, Thesis, Dataset, Package ConferenceItem, ExamPaper, JournalArticle, PublishedWork, Thesis, Dataset, Package
  #   Add values in constantized form, eg. 'ConferenceItem'
  # config.selected_models = []

  # Solr fields that will be used as facets in the search page.
  #   The ordering of the field names is the order of the display
  #   The properties must have been indexed as facetable
  #   Add values as symbols (eg. :creator)
  # config.facet_properties += [] # add to the end of the current list
  # config.facet_properties -= [] # remove from the current list
  # config.facet_properties = [] # replace the current list

  # Solr fields to be displayed in the index (search results) view
  #   The ordering of the field names is the order of the display
  #   Add values as symbols (eg. :creator)
  # config.index_properties += [] # add to the end of the current list
  # config.index_properties -= [] # remove from the current list
  # config.index_properties = [] # replace the current list

  # Fields in the form that should only accept a single value, ie. disable the 'add another' button.
  #   Add values as symbols (eg. :creator)
  # config.singular_properties += [] # add to the list
  # config.singular_properties -= [] # remove from the list
  # config.singular_properties += [] # replace the current list

  # WORK PROPERTIES

  # For each model, there are two configurations available.
  # Both are set to defaults:
  #    _required fields defaults to the Hyrax default (title, creator, keyword, rights_statment)
  #    _properties defaults to all properties available to that model, alphabetized
  #  Example:
  #    config.conference_item_properties = []
  #    config.conference_item_properties_required = []

  # PROPERTY MAPPINGS
  # All properties should be included in property_mappings. This is used by generators for building
  #   schema_org, locales, catalog_controller and attribute_rows. Adding info here and using
  #   generators saves on a lot of manual editing.
  #
  # To add a new local property (new_property below), do:
  #   config.property_mappings[:new_property] = {}
  #
  # To change an existing property (existing_property), do:
  #   config.property_mappings[:existing_property] = {}
  #
  # The contents of a property_mappings key:
  #
  #   config.property_mappings[:existing_property] =
  #     {
  #       # REQUIRED (if the property will appear in search results): a string formatted as per the example shown
  #       index: "('existing_property', :stored_searchable)",
  #
  #       # OPTIONAL: label for use in the form, show page, search results and facet
  #       label: 'My Property Label',
  #
  #       # OPTIONAL: help_text for use in the form
  #       help_text: 'Use this to describe something or other',
  #
  #       # OPTIONAL: reference to a renderer used to format the display of the text in the show page
  #       # in this eg. `app/renderers/existing_property_attribute_renderer.rb` must exist
  #       render_as: 'existing_property',
  #
  #       # OPTIONAL reference to a helper method used to format the display of the text in the search results
  #       # in this eg. the `existing_property_helper` method must exist in app/helpers, eg. in hyrax_helper.rb
  #       helper_method: 'existing_property_helper',
  #
  #       # OPTIONAL mapping to a schema.org property to be used in embedded metadata
  #       schema_org: {
  #         # in this eg. we have decided that the closest property match in schema.org is contributor
  #         property: 'contributor'
  #     }
  # }
end
