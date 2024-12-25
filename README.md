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
