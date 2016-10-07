get '/decks' do
  @decks = Deck.all

  erb :decks
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @round = Round.new
  @index = 0
  #@round.user =
  @round.deck = @deck
  @round.save

  @card = @deck.cards.first
  erb :cards
end

post '/answer' do
  @card = Card.find_by_id(params[:card_id])
  @round = Round.find_by_id(params[:round_id])
  @deck = @card.deck
  @index = params[:index].to_i
  guess = Guess.new
  if params[:answer] == @card.answer
    guess.correct += 1
  else
    guess.wrong += 1
  end
  guess.save
  @round.guesses << guess
  @round.save
  @index += 1
  @card = @deck.cards[@index]
  erb :cards

end
