module.exports = (robot) ->
  robot.hear /\w+(\w{2,})(\W+)\1\w+/, (msg) ->
    new_word = msg.match[0].replace(msg.match[1] + msg.match[2], '')
    msg.send "#{new_word}, you mean?"
