class SamlIdpController < SamlIdp::IdpController

  def idp_make_saml_response
    encode_response
    @guid = params[:guid]
  end

  def custom_attributes
    attrs = %[<Attribute Name="guid" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri"><AttributeValue>#{params[:guid]}</AttributeValue></Attribute>]
  end

end