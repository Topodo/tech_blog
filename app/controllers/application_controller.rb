class ApplicationController < ActionController::Base
  before_action :get_topics
  protect_from_forgery with: :exception

  def get_topics
    @topics = Topic.all
  end
end
