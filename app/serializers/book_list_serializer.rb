# frozen_string_literal: true
class BookListSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :price, :published_date
end
