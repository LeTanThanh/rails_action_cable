jQuery(document).on 'turbolinks:load', ->
  messages = $('#js-container-messages')

  if $('#js-container-messages').length > 0
    App.client_connection = App.cable.subscriptions.create {
        channel: 'ChatRoomsChannel'
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        # Data received

      send_message_to_server_channel: (message, chat_room_id) ->
        @perform 'receive_message_from_client', message: message, chat_room_id: chat_room_id

    $('#js-form-send-message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#js-textarea-message')

      if $.trim(textarea.val()).length > 1
        App.client_connection.send_message_to_server_channel textarea.val(), messages.data('chat-room-id')
        textarea.val('')

      e.preventDefault()
      return false
