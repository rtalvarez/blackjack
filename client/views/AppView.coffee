class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button active">Hit</button> <button class="stand-button active">Stand</button>
    <button class="hidden gameOver">Play again?</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()

  initialize: ->
    @render()
    @model.on 'change:endGameState', ->
      console.log 'no'
      $('.active').toggleClass('hidden')
      $('.gameOver').toggleClass('hidden')
    , @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
