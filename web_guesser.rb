require 'sinatra'
require 'sinatra/reloader'


@@SECRET_NUMBER = rand(100)
@@num_guess = 5
guess = nil

def check_guess(guess)
  if guess == nil
    style = init_guess
    message = "Lets start!"

  elsif guess.to_i > @@SECRET_NUMBER
    message = "guess is too high!"
    style = "high"
    @@num_guess -= 1
 
 elsif guess.to_i < @@SECRET_NUMBER
    message = "guess is too low!"
    style = "low"
    @@num_guess -= 1
  
  else
    message = "The secret number is: " + guess.to_str
    style = "correct"
    @@num_guess = 5
  end

  if @@num_guess == 0
    message = "oops! you've lost. Let's choose a new number."
    style = init_guess
  end

  return message, style, @@num_guess
end

def init_guess
  style = "init"
  @@num_guess = 5
  @@SECRET_NUMBER = rand(100)

  return style, @@num_guess, @@SECRET_NUMBER
end


get '/' do
  guess = params["guess"]
  message, style, num_guess = check_guess(guess) 

  erb :index, :locals => {:message => message, :style => style, :num_guess => num_guess}

end

