class BooksController < ApplicationController
  include JSONAPI::Fetching
  include JSONAPI::Filtering
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    allowed = ['title', 'authors_name']
    jsonapi_filter(Book.all, allowed) do |filtered|
      render jsonapi: filtered.result
    end

    # @books = Book
    # .all
    # .includes(:authors)
    # .page(params.dig(:page, :number))  #params[page][number] => &page[number]=2
    # .per(params.dig(:page, :size))     #params[page][size] => &page[size]=10
    # # render json: @books,
    # #   include: [:authors],
    # #   fields: {books: [:title, :num_pages], authors: [:full_name, :bar]}
    #
    # # ?include=authors&fields[books]=title,num_pages&fields[authors]=full_name, foo
    # render json: @books,
    #   include: params[:include]&.split(','),
    #   fields: params[:fields]&.as_json&.symbolize_keys&.transform_values { |v| v.split(',').map(&:to_sym)}
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def book_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:title, :language_code, :num_pages, :authors])
    end

    def jsonapi_include
      super & ['authors']
    end
end
