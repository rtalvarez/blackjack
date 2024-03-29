// Generated by CoffeeScript 1.7.1
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.CardView = (function(_super) {
    __extends(CardView, _super);

    function CardView() {
      this.template = __bind(this.template, this);
      return CardView.__super__.constructor.apply(this, arguments);
    }

    CardView.prototype.className = 'card';

    CardView.prototype.template = function(obj) {
      var rankName, suitName;
      rankName = obj['rankName'];
      suitName = obj['suitName'];
      if (!this.model.get('revealed')) {
        return _.template('<img src="img/card-back.png"></img>');
      } else {
        return _.template("<img src='img/cards/" + rankName + "-" + suitName + ".png'></img>");
      }
    };

    CardView.prototype.initialize = function() {
      this.model.on('change', (function(_this) {
        return function() {
          return _this.render;
        };
      })(this));
      return this.render();
    };

    CardView.prototype.render = function() {
      this.$el.children().detach().end().html;
      this.$el.html(this.template(this.model.attributes));
      if (!this.model.get('revealed')) {
        return this.$el.addClass('covered');
      }
    };

    return CardView;

  })(Backbone.View);

}).call(this);

//# sourceMappingURL=CardView.map
