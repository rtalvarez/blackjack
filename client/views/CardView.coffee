class window.CardView extends Backbone.View

  className: 'card'

  template: (obj) =>
    rankName = obj['rankName']
    suitName = obj['suitName']

    if not @model.get 'revealed'
      _.template '<img src="img/card-back.png"></img>'
    else
      _.template "<img src='img/cards/#{rankName}-#{suitName}.png'></img>"
    #_.template img
  # <img src='../../img/cards/xxxx.png'></img>

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
