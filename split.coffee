# Split.test "experiment", ["a_group", "b_group"]
# => "a_group"
#
# Split.test "experiment", ["a_group", "b_group"], (group) ->
#   ... do something cool with the group ...
#
# Split.test "experiment"
# => "a_group"

window.Split = {
  test: (name, groups=null, callback=null) ->
    if $.cookie(name) || !groups?
      group = $.cookie name
    else
      group = @util.selectRandom(groups)
      $.cookie name, group, expires: 365

    group = @util.cast(group)

    if callback? then callback(group) else group

  clear: (name) -> $.removeCookie name

  util:
    selectRandom: (groups) -> groups[Math.floor(Math.random() * groups.length)]

    cast: (string) ->
      if number = parseInt(string)
        number
      else if string == "true"
        true
      else if string == "false"
        false
      else
        string
}