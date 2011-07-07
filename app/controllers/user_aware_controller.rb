class UserAwareController < ApplicationController
  before_filter :authenticate_user!
  
end