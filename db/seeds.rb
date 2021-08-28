Soap.destroy_all
MyClient.destroy_all
Client.destroy_all
User.destroy_all

user = User.create(first_name: 'Keenan', last_name: 'Jones', password: '12334455', license_number: '4210f14', bio: 'Writing this seed')

client = Client.create(first_name: 'Kuzco', last_name: 'Jones', occupation: 'Desk-Worker', gender: 'M', date_of_birth: Date.new(2001,2,3), address: 'here S. Pesa, KY', phone_number: '443-554-1112')

my_client = MyClient.create(user: user, client: client, coolness_rating: 4.0, tipped: 5.00, likelihood_to_return: 5.6, visits: 2)

soap_note = Soap.create(my_client: my_client, subject: 'Working, taking care of business', objective: 'Kicking names and taking ass', assessment: 'This guy is a asshole', plan: 'Add money to douche jar', notes: "He's cool!!!")

# t.text "subject"
# t.text "objective"
# t.text "assessment"
# t.text "plan"
# t.text "notes"