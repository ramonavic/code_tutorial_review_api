# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

frank = User.create( email: 'frank@ex.com', password: 'abcd1234' )
alice = User.create( email: 'alice@ex.com', password: 'abcd1234' )
anton = User.create( email: 'anton@ex.com', password: 'abcd1234' )

Tutorial.create(title: "React 1, 2, 3", description: "Adding authentication to React", link: "https://auth0.com/blog/2015/04/09/adding-authentication-to-your-react-flux-app/", user_id: frank.id)
Tutorial.create(title: "Rails Thrills", description: "This is an advanced tutorial about the hard parts of Rails", link: "https://auth0.com/blog/2015/04/09/adding-authentication-to-your-react-flux-app/", user_id: alice.id)
