// Generated by CoffeeScript 1.4.0
var cookieCommand,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

cookieCommand = (function(_super) {

  __extends(cookieCommand, _super);

  function cookieCommand() {
    return cookieCommand.__super__.constructor.apply(this, arguments);
  }

  cookieCommand.prototype.init = function() {
    this.command = '.cookie';
    this.parseType = 'startsWith';
    return this.rankPrivelege = 'user';
  };

  cookieCommand.prototype.getCookie = function() {
    var c, cookies;
    cookies = ["a chocolate chip cookie", "a sugar cookie", "an oatmeal raisin cookie", "a 'special' brownie", "an animal cracker", "a scooby snack", "a blueberry muffin", "a cupcake", "a pimento taco"];
    c = Math.floor(Math.random() * cookies.length);
    return cookies[c];
  };

  cookieCommand.prototype.functionality = function() {
    var msg, r, user;
    msg = this.msgData.message;
    r = new RoomHelper();
    if (msg.substring(8, 9) === "@") {
      user = r.lookupUser(msg.substr(9));
      if (user === false) {
        API.sendChat("/em doesn't see '" + msg.substr(9) + "' in room and eats a taco himself");
        return false;
      } else if (user.username === this.msgData.from) {
        return API.sendChat("Pretty selfish to hoard all the treats for yourself, " + this.msgData.from + "...");
      } else {
        return API.sendChat("@" + user.username + ", " + this.msgData.from + " handed you " + this.getCookie() + ". Enjoy.");
      }
    }
  };

  return cookieCommand;

})(Command);
