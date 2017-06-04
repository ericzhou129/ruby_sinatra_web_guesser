require 'sinatra'
require 'sinatra/reloader'

$SECRET_NUMBER = rand(100)

def check_guess(guess)
    if guess.to_i > $SECRET_NUMBER
      message = "guess is too high!"
      style = "high"
    elsif guess.to_i < $SECRET_NUMBER
      message = "guess is too low!"
      style = "low"
    else
      message = "The secret number is: " + guess.to_str
      style = "correct"
    end
    return message, style
end
# guess = 50
# message, style = check_guess(guess)
# puts message
# puts style

get '/' do
 
  guess = params["guess"]
  message, style = check_guess(guess) 

  erb :index, :locals => {:message => message, :style => style}

end

