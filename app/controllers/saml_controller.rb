require 'ruby-saml'
class SamlController < ApplicationController

  def init
    request = OneLogin::RubySaml::Authrequest.new
    if params[:consumer_service_url].present?
      redirect_to(request.create(saml_settings))
    else
      redirect_to(root_path, alert: 'Consumer Service URL is required!')
    end
  end

  def metadata
    meta = OneLogin::RubySaml::Metadata.new
    render xml: meta.generate(saml_settings)
  end

  private

  def saml_settings
    settings = OneLogin::RubySaml::Settings.new
    settings.assertion_consumer_service_url = params[:consumer_service_url]
    settings.issuer = params[:consumer_service_url]
    settings.idp_sso_target_url = "#{host_with_port}/saml/auth"
    settings.idp_cert_fingerprint = SamlIdp::Default::FINGERPRINT
    settings.name_identifier_format = "urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified"
    settings
  end

  def host_with_port
    str = "#{request.protocol}#{request.host}"
    str << ':3001' if Rails.env.development?
    str
  end
end

