Rails.application.routes.draw do
  mount FiatUsers::Engine => "/fiat_users"
end
