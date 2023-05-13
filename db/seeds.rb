require "faker"

Faker::Config.locale = 'en'
name = Faker::Name.name
#  Coffee.destroy_all # limpa o db do coffee
#  User.destroy_all # limpa o db do user

user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "123123")

6.times do
  Coffee.create!(
    brand: Faker::Coffee.brand,
    price: Faker::Commerce.price(range: 0..10.0, as_string: true), # Utiliza a função price da biblioteca Faker
    description: Faker::Coffee.notes,
    user: user, # ou user_id: user.id
    region: Faker::Coffee.origin,
    bean: Faker::Coffee.variety,
    roast: Faker::Coffee.roast,
    sensory_note: Faker::Coffee.notes,
    classification: Faker::Number.number(digits: 2),
    grinding: Faker::Coffee.grind_size
  )
  # puts Faker::Number.between(from: 1.0, to: 1000.0)
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# app/models/user.rb


# Preciso quebrar o data base criado com o faker, mas como? rails db:drop db:create db:migrate
# R: não, com : # Coffee.destroy_all # limpa o db do coffee e # User.destroy_all # limpa o db do user


# class User < ApplicationRecord
#   has_many :user_coffees, dependent: :destroy
#   validates :name, presence: true
#   validates :email, presence: true, uniqueness: true
#   validates :password, presence: true, length: { minimum: 6 }
# end

# class Coffee < ApplicationRecord
#   has_many :user_coffees, dependent: :destroy
#   validates :brand, presence: true
#   validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
#   validates :description, presence: true, length: { minimum: 10 }
#   validates :region, :roast, :classification, :grinding, presence: true
# end

# class User_Coffee < ApplicationRecord
#   belongs_to :user
#   belongs_to :coffee
#   # nessa validação, um usuário não possa ter o mesmo café mais de uma vez
#   validates_uniqueness_of :user_id, scope: :coffee_id
#   validates :quantity, presence: true, numericality: { greater_than: 0 }
#     # nessa validação, um usuário não possa ter o mesmo café mais de uma vez\n  validates_uniqueness_of :coffee_id, scope: :user_id
# end
