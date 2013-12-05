Testanimal::Application.routes.draw do
  resources :animals do
    member do
      patch 'feed'
      patch 'more'
         
    end
  end
 root 'welcome#index'
end
