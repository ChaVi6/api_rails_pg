Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs
        put 'mark_deleted', to: 'companies#mark_deleted'
      end
      resources :geeks
      resources :applies
    end
  end

  match "/*path", to: "application#catch_404", via: :all
end