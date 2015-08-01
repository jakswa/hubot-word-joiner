# Description:
#   A hubot script that seizes opportunities to join words into newer,
#   hopefully better words.
#
# Configuration:
#   HUBOT_WORD_JOINER_MINIMUM: optional
#
# Notes:
#   The minimum word length threshold cannot be set to less than two.
#
# Author:
#   Jake Swanson

overlap = 2
minimum = Math.max(overlap, parseInt(process.env.HUBOT_WORD_JOINER_MINIMUM ? 3, 10)) - overlap
pattern = new RegExp '\\w{' + minimum + ',}(\\w{' + overlap + ',})(\\W+)\\1\\w{' + minimum + ',}'

module.exports = (robot) ->
  robot.hear pattern, (msg) ->
    new_word = msg.match[0].replace(msg.match[1] + msg.match[2], '')
    msg.send "#{new_word}, you mean?"
