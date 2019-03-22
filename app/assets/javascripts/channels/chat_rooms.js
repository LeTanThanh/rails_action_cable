(function() {
  jQuery(document).on('turbolinks:load', function() {
    var messages;
    messages = $('#js-container-messages');

    if ($('#js-container-messages').length > 0) {
      App.client_connection = App.cable.subscriptions.create({
        channel: 'ChatRoomsChannel',
        chat_room_id: messages.data('chat-room-id')
      }, {
        connected: function() {
        },
        disconnected: function() {
        },
        received: function(data) {
          messages.append(data['message']);
        },

        send_message_to_server_channel: function(message, chat_room_id) {
          this.perform('receive_message_from_client', {
            message: message,
            chat_room_id: chat_room_id
          });
        }
      });

      $('#js-form-send-message').submit(function(e) {
        var $this, textarea;
        $this = $(this);
        textarea = $this.find('#js-textarea-message');

        if ($.trim(textarea.val()).length > 1) {
          App.client_connection.send_message_to_server_channel(textarea.val(), messages.data('chat-room-id'));
          textarea.val('');
        }

        e.preventDefault();
        return false;
      });
    }
  });

}).call(this);
