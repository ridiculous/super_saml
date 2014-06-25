require 'ruby-saml'
class SamlController < ApplicationController

  def init
    request = OneLogin::RubySaml::Authrequest.new
    url = request.create(saml_settings)
    url << "&RelayState=#{params[:relay_state]}" if params[:relay_state]
    redirect_to(url)
  end

  def metadata
    meta = OneLogin::RubySaml::Metadata.new
    render xml: meta.generate(saml_settings)
  end

  private

  def saml_settings
    settings = OneLogin::RubySaml::Settings.new
    settings.assertion_consumer_service_url = ''
    settings.issuer = ''
    settings.idp_sso_target_url = "#{host_with_port}/saml/auth"
    settings.idp_cert_fingerprint = SamlIdp::Default::FINGERPRINT
    settings.name_identifier_format = "urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified"
    settings
  end

  def host_with_port
    str = "#{request.protocol}#{request.host}"
    str << ':3000' if Rails.env.development?
    str
  end
end

