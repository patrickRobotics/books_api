# RUBY API app

Some concepts of rubby api bootstrap application


## Jbuilder
Why Jbuilder:
* Stick with the rails way
* JSON representation belongs to view layer
* Include unrelated models &/or non-model data in a single request
* Creating a complex JSON objects
* Use helper methods and partials

## Rabl Gem
Why Rabl:
* Serialize into other formats beside JSON
* Data representation is handled by view layer
* Include unrelated models &/or non-model data in a single request
* Creating complex JSON objects
* Use helper methods
* Inheritance to reduce code duplication
* When using non-Rails framework (Sinatra, Padrino)
* Good (documentation)[https://github.com/nesquena/rabl]

## ActiveModelSerializers
Why ActiveModelSerializers?
* Use Serializer objects instead of DSL or view template
* The model layer handles the Serialization of data into JSON (not the view)
* Create simple JSON structures with model-name-based keys
* No massive customization needed
* Inheritance to create reusable JSON
* Relationships (has_many, has_one, belongs_to) to include child nodes
* Include unrelated models &/or non-model data in a single request
* Creating a complex JSON objects
* No helper methods


## JSON:API and Active Model Serializers
Why JSON:API?
* Follow the JSON:API specifications
* Focus on what matters:
  - include relationships e.g. include=author,comments
  - only needed fields e.g. fields=[post]=title,body & fields[author]=name
* Filtering e.g. filter[author_id]=1,2,3
* Sorting e.g. sort=-created_at, title
* Pagination e.g. page=[number]=1 & page[size]=30
* Add pagination links (by default)
* Efficient caching
Why JSON:API with AMS gem?
* Follow the JSON:API specifications
* Keep using Active Model Serializers
* Static includes and fields
* Pagination links
* Model related links
* Deserialization
JSON API (documentation)[https://github.com/rails-api/active_model_serializers/blob/0-10-stable/docs/jsonapi/schema.md]
