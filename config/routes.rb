Rails.application.routes.draw do

  namespace :api do
     scope :v1 do
       
  get "/posts", to: "posts#show_feed"
  post "/posts", to: "posts#create"

end
end
end
