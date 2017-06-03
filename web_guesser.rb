require 'sinatra'
require 'sinatra/reloader'

@@SECRET_NUMBER = rand(100)

def check_guess(guess)
    if guess.to_i > @@SECRET_NUMBER
      message = "guess is too high!"
    elsif guess.to_i < @@SECRET_NUMBER
      message = "guess is too low!"
    else
      message = "The secret number is: " + guess
    end
    return message
end

get '/' do
 
  guess = params["guess"]
  message = check_guess(guess) 
  
  erb :index, :locals => {:message => message}

end

