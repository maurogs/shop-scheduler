Rails.application.routes.draw do
  scope '/(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :shops, only: [:index, :show]

    root 'shops#index'
  end
end
