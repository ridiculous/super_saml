class SamlIdpController < SamlIdp::IdpController

  layout 'application'

  def new
    @fields = Field.all
  end

  def idp_make_saml_response
    encode_response
  end

  def custom_attributes
    ''.tap do |str|
      params[:attributes].each do |key, val|
        str << %[<Attribute Name="#{key}" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri"><AttributeValue>#{val}</AttributeValue></Attribute>]
      end
    end
  end

end