Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products/:id" => "products#show"
    get "/products" => "products#index"
    # get "/product" => "products#product_query_method"
    # get "/uppers_and_downers" => "products#uppers_and_downers_method"
    # get "/friskeywhiskey" => "products#whiskey_method"
    # get "/heart_butt" => "products#heart_butt_method"
    # get "/trash_queen" => "products#trash_queen_method"
    # get "/home_sweet" => "products#home_sweet_method"
    # get "/crystal_heart" => "products#crystal_heart_method"
    # get "/death_of_magic" => "products#death_of_magic_method"
  end
end
