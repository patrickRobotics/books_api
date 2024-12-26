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

JSON API example request: `localhost:3000/books.json?include=authors&fields[books]=title,num_pages&fields[authors]=full_name,foo&page[size]=2`
```javascript
{
    "data": [
        {
            "id": "1",
            "type": "books",
            "attributes": {
                "title": "Harry Porter Collections",
                "num_pages": 3342
            },
            "links": {
                "self": "/books/1",
                "authors": "/authors?book_id=1"
            }
        },
        {
            "id": "2",
            "type": "books",
            "attributes": {
                "title": "The Hitchhiker's Guide to the Galaxy",
                "num_pages": 815
            },
            "links": {
                "self": "/books/2",
                "authors": "/authors?book_id=2"
            }
        }
    ],
    "included": [
        {
            "id": "1",
            "type": "authors",
            "attributes": {
                "full_name": "J. K. Rowling",
                "foo": "test"
            }
        },
        {
            "id": "10",
            "type": "authors",
            "attributes": {
                "full_name": "Douglas Adams",
                "foo": "test"
            }
        }
    ],
    "links": {
        "self": "http://localhost:3000/books.json?fields%5Bauthors%5D=full_name%2Cfoo&fields%5Bbooks%5D=title%2Cnum_pages&include=authors&page%5Bnumber%5D=1&page%5Bsize%5D=2",
        "first": "http://localhost:3000/books.json?fields%5Bauthors%5D=full_name%2Cfoo&fields%5Bbooks%5D=title%2Cnum_pages&include=authors&page%5Bnumber%5D=1&page%5Bsize%5D=2",
        "prev": null,
        "next": "http://localhost:3000/books.json?fields%5Bauthors%5D=full_name%2Cfoo&fields%5Bbooks%5D=title%2Cnum_pages&include=authors&page%5Bnumber%5D=2&page%5Bsize%5D=2",
        "last": "http://localhost:3000/books.json?fields%5Bauthors%5D=full_name%2Cfoo&fields%5Bbooks%5D=title%2Cnum_pages&include=authors&page%5Bnumber%5D=2&page%5Bsize%5D=2"
    }
}
```

Example POST request to create a book: `localhost:3000/books`
```javascript
{
    "data": {
        "type": "book",
        "attributes": {
            "title": "Against All Odds",
            "num_pages": 142,
            "language_code": "ar"
        },
        "relationships": {
            "authors": {
                "data": [
                    {
                        "type": "author",
                        "id": 13
                    },
                    {
                        "type": "author",
                        "id": 10
                    },
                    {
                        "type": "author",
                        "id": 14
                    }
                ]
            }
        }
    }
}
```
