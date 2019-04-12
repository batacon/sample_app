class ApplicationController < ActionController::Base
  def hello
    render html: 'ハロー'
  end
end
