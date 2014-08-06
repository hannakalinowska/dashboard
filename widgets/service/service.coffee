
class Dashing.Service extends Dashing.Widget

  onData: (data) ->
    if data.status
      node = $(@get('node'))
      node.attr 'class', node.attr('class').replace(/\bstatus-\S+/g, '')
      node.addClass "status-#{data.status}"
