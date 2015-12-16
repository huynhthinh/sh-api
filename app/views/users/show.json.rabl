object @user

node(:name) {|t| t.full_name}
attributes :first_name, :last_name, :phone_number, :id, :email, :occupation
attributes :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
attributes :locked_at, :confirmed_at, :is_enabled
attributes :time_zone, :locale, :theme, :website, :facebook, :twitter, :owner_id, :owner_type
attributes :created_at, :updated_at, :created_by, :updated_by, :is_removed


node(:is_active) { |t| t.is_enabled }
node(:is_locked) { |t| !t.locked_at.nil? }
node(:asset_class) { |t| t.class.name.downcase.pluralize }

