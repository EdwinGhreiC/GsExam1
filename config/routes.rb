Rails.application.routes.draw do

  root 'examinations#index'

  #登录
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  #考试场次
  get 'exam' => 'examinations#index'
  get 'exam/add' => 'examinations#add'
  post 'exam/add' => 'examinations#create'
  delete 'exam/:id/delete' => 'examinations#destroy', as: :delete_examination
  get 'exam/:id' => 'examinations#show', as: :show_examination
  post 'exam/submit' => 'examinations#submit'
  
  #题库
  get 'questions' => 'questions#index'
  get 'questions/add' => 'questions#add'
  get 'questions/:id' => 'questions#show', as: :question
  get 'questions/:id/edit' => 'questions#edit', as: :edit_question
  post 'questions' => 'questions#save'
  patch 'questions/:id' => 'questions#update'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
