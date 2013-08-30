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
      group = @selectRandom(groups)
      $.cookie name, group

    if callback? then callback(group) else group

  clear: (name) -> $.removeCookie name

  selectRandom: (groups) -> groups[Math.floor(Math.random() * groups.length)]
}