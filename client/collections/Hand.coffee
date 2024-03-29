class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @scores()[0] > 21 then @trigger 'endGame', @


  stand: ->
    @trigger 'dealerTurn', @

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  adjustedScore: ->
    scores = @scores()
    if scores.length is 1
      scores[0]
    else if scores[1] > 21
      scores[0]
    else
      Math.max(scores[0], scores[1])

  dealerPlay: ->
    if not @.at(0).get 'revealed' then @.at(0).flip()

    score = @scores()

    if score.length is 2 and score[1] <= 21 then score = score[1]
    else score = score[0]

    if score < 17
      @hit()
      do @dealerPlay
    else @trigger 'endGame', @



