class UsersController < ApplicationController

def index
  matching_users = User.all
  
  @list_of_users = matching_users.order({ :username => :asc})

  render ({ :template => "user_templates/index.html.erb"})
end

def show 

  url_username = params.fetch("path_username")
  matching_usernames = User.where({ :username => url_username})

  @the_user = matching_usernames.first

  if @the_user == nil
    redirect_to("/404")
  else
    render ({ :template => "user_templates/show.html.erb"})
  end
end

def create 

  # Parameters: {"query_username"=>"thisisyiwei2"}

  input_username = params.fetch("query_username")

  a_new_user = User.new
  a_new_user.username = input_username

  a_new_user.save

  # render({ :template => "user_templates/create.html.erb"})

  next_url = "/users/" + a_new_user.username
  redirect_to(next_url)
end

def update

  # Parameters: {"query_username"=>"thisisyiwei4", "modify_username"=>"122"}

  the_user_id = params.fetch("modify_username")
  matching_users = User.where({ :id => the_user_id})
  the_user = matching_users.at(0)

  input_user = params.fetch("query_username")
  
  the_user.username = input_user
  the_user.save


  # render({ :template => "user_templates/update.html.erb"})

  next_url = "/users/" + the_user.username
  redirect_to(next_url)

end

end