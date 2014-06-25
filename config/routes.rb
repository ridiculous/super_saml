SuperSaml::Application.routes.draw do

  root to: 'home#index'

  get 'saml/initialize', :to => 'saml#init'
  post 'saml/callback', :to => 'saml#consume'
  get 'saml/metadata', :to => 'saml#metadata'
  get 'saml/auth' => 'saml_idp#new'
  post 'saml/auth' => 'saml_idp#create'

end
