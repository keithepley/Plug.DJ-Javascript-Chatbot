// Generated by CoffeeScript 1.4.0
var uservoiceCommand,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

uservoiceCommand = (function(_super) {

  __extends(uservoiceCommand, _super);

  function uservoiceCommand() {
    return uservoiceCommand.__super__.constructor.apply(this, arguments);
  }

  uservoiceCommand.prototype.init = function() {
    this.command = ['/uservoice', '/idea'];
    this.parseType = 'exact';
    return this.rankPrivelege = 'user';
  };

  uservoiceCommand.prototype.functionality = function() {
    var msg;
    msg = 'Have an idea for the room, our bot, or an event?  Awesome! Submit it to our uservoice and we\'ll get started on it: d';
    msg += ' (please don\'t ask for mod)';
    return API.sendChat(msg);
  };

  return uservoiceCommand;

})(Command);
