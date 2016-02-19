class Users::SessionsController < Devise::SessionsController
  respond_to :json
# before_action :configure_sign_in_params, only: [:create]
#   prepend_before_action :require_no_authentication, only: [:new, :create]
#   prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_filter :require_no_authentication, :only => [:create ]
  # before_filter :ensure_params_exist, only: :create
  # skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    # render :json => '{"successful": "invalid email and password combination"}'
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end


  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:success => true}
  end

  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end

end
