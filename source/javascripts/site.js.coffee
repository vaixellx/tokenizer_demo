#= require jquery
#= require jquery.fullpage.min
#= require highlight.pack

$ ->
  $('#full-page').fullpage(
    navigation: true,
		navigationPosition: 'right'
  )

  $('code').each (i, block) ->
    hljs.highlightBlock(block)
