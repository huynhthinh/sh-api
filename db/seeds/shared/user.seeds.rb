
puts '***************** Starting account seeding'

## add root account
sh_root = Account.create!(
    uuid: '03d1c6a1-2787-46ea-bd91-bc0183586778',
    name: 'Smart SG',
    account_type: 1,
    email: 'info@tripolis.com',
    domain_name: 'development.sh.com',
    contact_person_name: 'Smart SG_contact_name',
    contact_person_email: 'info@tripolis.com',
    contact_person_phone: '+31 (0)20 747 0111',
    logo: '',
    updated_by: 'system',
    created_by: 'system'
)

def self.create_account(num, type)

  account = Account.create!(
      uuid: "887de924-bd9e-4e4e-bf8c-582dda7565d#{num}",
      name: "#{type}#{num}",
      account_type: type,
      email: "core_#{num}#{type}.@smartsg.com",
      domain_name: "account#{num}.com",
      contact_person_name: "core_#{num}_contact_name",
      contact_person_email: "core_#{num}.@tripolis.com",
      contact_person_phone: "642153#{num}",
      logo: '',
      # parent_account: parent,
      updated_by: 'system',
      created_by: 'system'
  )

  account.addresses << Address.create!(
      street_name: "#{type}#{num} street",
      house_number: "123-#{num}",
      address_line_1: "core_#{type}#{num} house_name",
      address_line_2: "core_#{type}#{num} house_name",
      postcode: "5432-#{num}",
      country: "core_#{type}#{num} country",
      province: "core_#{type}#{num} stat",
      city: "core_#{type}#{num} city"
  )
  account
end

## add distributor accounts
core_distributor1 = create_account(1, Account.account_types[:distributor])
core_distributor2 = create_account(2, Account.account_types[:distributor])

core_distributor1.account = sh_root
core_distributor2.account = sh_root
core_distributor1.save
core_distributor2.save

## add var accounts into distributor1
core_var1 = create_account(3, Account.account_types[:var])
core_var2 = create_account(4, Account.account_types[:var])
core_var3 = create_account(5, Account.account_types[:var])

core_var1.account = core_distributor1
core_var2.account = core_distributor1
core_var3.account = core_distributor2
core_var1.save
core_var2.save
core_var3.save

=begin don't use customer level for now, root, var and distributor are enough for the moment to keep it simple
customer1 = create_account(1, Account.account_types[:customer])
customer2 = create_account(2, Account.account_types[:customer])

customer1.account = core_var1
customer2.account = core_var2
customer1.save
customer2.save
=end

## create tenant
def self.create_tenant(parent, num, guid)

  tenant = Tenant.new(
      name: "tenant_#{num}",
      email: "tenant#{num}@tenant.com",
      company_name: "tenant company #{num}",
      uuid: guid,
      updated_by: 'system',
      created_by: 'system',
      domain_name: "tenant#{num}.com",
      contact_person_name: "core_tenant_#{num}_contact_name",
      contact_person_email: "core_tenant_#{num}.@smartsg.com",
      contact_person_phone: "987685#{num}",
  )

  tenant.addresses << Address.create!(
      street_name: "tenant#{num} street",
      house_number: "456-#{num}",
      address_line_1: "tenant#{num} house_name",
      address_line_2: "tenant#{num} house_name",
      postcode: "7633-#{num}",
      country: "tenant#{num} country",
      province: "tenant#{num} stat",
      city: "tenant#{num} city"
  )

  parent.tenants << tenant
  tenant.save
  tenant
end

test_tenant1_1 = create_tenant(sh_root, "global", "2b66d7a9-8cb5-4802-838a-f1f58869bbf5")
test_tenant1_2 = create_tenant(core_distributor1, "core_dist1_1", "240f4575-702d-4c2b-a300-ba14ae514d2e")
test_tenant2_1 = create_tenant(core_distributor1, "core_dist1_2", "3f42030e-abdb-4a83-855c-1c4ff746da4c")


def self.create_role(role_name, account=nil, is_standard=false, scopes=nil, fixed_id=nil)


  if (fixed_id.nil?)
    Role.reset_pkey
    role = Role.create(
        name: role_name,
        is_standard: is_standard,
        created_by: 'system',
        updated_by: 'system'
    )
  else
    role = Role.new
    role.id = fixed_id
    role.name = role_name
    role.is_standard = is_standard
    role.created_by = 'system'
    role.updated_by = 'system'
    role.save!
  end



  if !account.nil?
    account.roles << role
  end

  if !scopes.nil?
    role.scopes = scopes
    role.save!
  end

  role
end


# create some default roles
system_administrator_standard_role = create_role 'system_administrator', sh_root, true
create_role('Root SA', sh_root)
create_role('Root copy writer', sh_root)
create_role('Root photo manager', sh_root)

create_role('core_dist1 SA', core_distributor1)
create_role('core_dist1 Copy writer', core_distributor1)
create_role('core_dist1 Photo manager', core_distributor1)


def self.create_admittance(user,role,tenant, default=false)
  Admittance.create!(
      role: role,
      user: user,
      tenant: tenant,
      is_default: default
  )
end


def self.create_user(num, account, email="user#{num}@smartsg.com")
  puts "email: #{email}"
  user = User.create!(name: 'smartsg',
                     first_name: email.split('@')[0].gsub('.', '_').classify,
                     last_name: "No#{num}",
                     email: email,
                     password: 'smartsg1',
                     confirmed_at: Time.now,
                     occupation: num,
                     theme: '',
                     facebook: "john.doe#{num}",
                     twitter: "john.doe#{num}",
                     website: "http://www.smartsg#{num}.com",
                     locale: 'vi',
                     created_by: 'system',
                     updated_by: 'system'
  )
  account.users << user
  p "user: #{user.id.to_s} : #{user.uid.to_s} : #{user.name}"
  user
end

# (1..4).each do |n|
#   user = create_user(n, sh_root)
#   create_admittance(user, contacts_manager, test_tenant1_1)
# end
#
# (5..7).each do |n|
#   user = create_user(n, sh_root)
#   create_admittance(user, content_manager, test_tenant1_2)
#   core_distributor1.users << user # does not make sense, just to show some data there
# end
#
# (8..10).each do |n|
#   user = create_user(n, sh_root)
#   create_admittance(user, campaigns_manager, test_tenant2_1)
#   core_distributor2.users << user # does not make sense, just to show some data there
#
# end

# admin = create_user(60, sh_root,  'contact_updater@smartsg.com')
# create_admittance(admin, contacts_manager, test_tenant1_1, true)
# create_admittance(admin, contacts_manager, test_tenant1_2,false)
#
#
# admin = create_user(61, sh_root, 'contact_watcher@smartsg.com')
# create_admittance(admin, contacts_watcher, test_tenant1_1, true)
# create_admittance(admin, contacts_watcher, test_tenant1_2,false)

puts '***************** Starting internal users seeding'

internal_users = %w(hdthinh@gmail.com amira11@gmail.com)

internal_users.each_with_index do |email, index|
  admin = create_user(index, sh_root, email)
  puts '***************** Starting admittance seeding'
  create_admittance(admin, system_administrator_standard_role, test_tenant1_1, true)
  create_admittance(admin, system_administrator_standard_role, test_tenant1_2,false)

end

primary_users = Usergroup.create(name: "Primary users",
                                 account: sh_root
)

primary_users.users << [User.find(1),User.find(3)]

puts '***************** Starting distributor users seeding'
# Seeding users for core_distributor1 account
core_distributor1_users = %w(dev2@smartsg.com core_dist1_user1@smartsg.com core_dist1_user2@smartsg.com core_dist1_user3@smartsg.com)

core_distributor1_users.each_with_index do |email, index|
  user = create_user(index+10, core_distributor1, email)
  create_admittance(user, system_administrator_standard_role, test_tenant1_1, true)
  create_admittance(user, system_administrator_standard_role, test_tenant1_2,false)

end




