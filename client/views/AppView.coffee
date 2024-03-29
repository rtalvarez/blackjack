class window.AppView extends Backbone.View

  template: _.template '<div id="main">
    <button class="hit-button active">Hit</button> <button class="stand-button active">Stand</button>
    <button class="replay-button hidden gameOver">Play again?</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    </div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .replay-button": ->
      @model.initialize()
      @render()

  initialize: ->
    @render()
    @model.on 'change:endGameState', ->
      $('.active').toggleClass('hidden')
      $('.gameOver').toggleClass('hidden')
    , @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
