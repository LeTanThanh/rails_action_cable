(function() {
  jQuery(document).on('turbolinks:load', function() {
    var messages = $('#js-container-messages');

    if (messages.length > 0) {
      var chat_room_id = messages.data('chat-room-id');
      var current_user_id = messages.data('current-user-id');

      App.client_connection = App.cable.subscriptions.create({
        channel: 'ChatRoomsChannel',
        chat_room_id: chat_room_id
      }, {
        connected: function() {
        },
        disconnected: function() {
        },
        received: function(data) {
          if(current_user_id == data['user_message_id']) {
            messages.append(data['user_message']);
          } else {
            messages.append(data['other_user_message']);
          }
        },
        send_message_to_server_channel: function(message, chat_room_id) {
          this.perform('receive_message_from_client', {
            message: message,
            chat_room_id: chat_room_id
          });
        }
      });

      $('#js-form-send-message').submit(function(e) {
        var $this = $(this);
        var textarea = $this.find('#js-textarea-message');

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
