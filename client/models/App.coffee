#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'endGameState', false
    @.get('playerHand').on 'endGame', ->
      @set 'endGameState', true
    , @
    @.get('dealerHand').on 'endGame', ->
      @set 'endGameState', true
    , @
    @.get('playerHand').on 'dealerTurn', ->
      @.get('dealerHand').dealerPlay()
    , @



