// Generated by CoffeeScript 1.4.0
(function() {

  window.Split = {
    test: function(name, groups, callback) {
      var group;
      if (groups == null) {
        groups = null;
      }
      if (callback == null) {
        callback = null;
      }
      if ($.cookie(name) || !(groups != null)) {
        group = $.cookie(name);
      } else {
        group = this.util.selectRandom(groups);
        $.cookie(name, group);
      }
      group = this.util.cast(group);
      if (callback != null) {
        return callback(group);
      } else {
        return group;
      }
    },
    clear: function(name) {
      return $.removeCookie(name);
    },
    util: {
      selectRandom: function(groups) {
        return groups[Math.floor(Math.random() * groups.length)];
      },
      cast: function(string) {
        var number;
        if (number = parseInt(string)) {
          return number;
        } else if (string === "true") {
          return true;
        } else if (string === "false") {
          return false;
        } else {
          return string;
        }
      }
    }
  };

}).call(this);
