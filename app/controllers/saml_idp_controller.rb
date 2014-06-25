class SamlIdpController < SamlIdp::IdpController

  def idp_make_saml_response
    encode_response
  end

  def custom_attributes
    attrs = '<Attribute Name="mids" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri"><AttributeValue>434507959881</AttributeValue></Attribute>'
    attrs << '<Attribute Name="guid" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri"><AttributeValue>80d9940f-9973-4da0-aafe-f715998969b7</AttributeValue></Attribute>'
  end

end