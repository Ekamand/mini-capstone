Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root to: "products#index"

    get "/products" => "products#index"
    get  "/products/low_price_index" => "products#low_price_index"
    get "/products/new" => "products#new"
    post "/products" => "products#create"

    get "/products/:id" => "products#show"

    # Edit and update
    get  "/products/:id/edit" => "products#edit" 
    patch "/products/:id" => "products#update"

    # get "/products/:id/destroy" => "products#destroy"
    delete "/products/:id" => "products#destroy"

    #search
    post "/search" => "products#search"
    get "/search" => "products#search"



    # Suppliers ================================================================
    get "/suppliers" => "suppliers#index"
    # get  "/supplier/low_price_index" => "products#low_price_index"
    get "/suppliers/new" => "suppliers#new"
    post "/suppliers" => "suppliers#create"

    get "/suppliers/:id" => "suppliers#show"

    # Edit and update
    get  "/suppliers/:id/edit" => "suppliers#edit" 
    patch "/suppliers/:id" => "suppliers#update"

    # get "/products/:id/destroy" => "products#destroy"
    delete "/suppliers/:id" => "suppliers#destroy"


    #signup
    get "/signup" => "users#new"
    post "/users" => "users#create"

    #login
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"

    #logout
    get "/logout" => "sessions#destroy"

    # #search
    # post "/search" => "products#search"
    # get "/search" => "products#search"


end
