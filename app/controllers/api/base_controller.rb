class Api::BaseController < ApplicationController

  def index
      render json: {
        code: 200,
        status: 'success',
        message: "Hello  let's Roll together."
      }
  end

end
