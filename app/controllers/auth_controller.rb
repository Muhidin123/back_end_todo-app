class AuthController < ApplicationController

    def create
      user = User.find_by(username: params[:username]) 
  
      if user && user.authenticate(params[:password])
          payload = { user_id: user.id }
          token = JWT.encode(payload, "secret", 'HS256')
          notes = Note.where(user_id: user.id)
          #ADD ALL NOTES FOR USER
          render json: { user: {id: user.id, username: user.username, token: token}, notes: notes}

      else
        render json: { error: 'Invalid username/password.' }, status: 401
      end
    end

    def show
      token = request.headers[:Authorization].split(' ')[1]
      decoded_token = JWT.decode(token, "secret" , true, { algorithm: 'HS256' })
      user_id = decoded_token[0]['user_id']
      user = User.find(user_id)
      notes = Note.where(user_id: user.id)
      #ADD All notes for user
      render json: { user: {id: user.id, username: user.username, token: token}, notes: notes}
    end
end