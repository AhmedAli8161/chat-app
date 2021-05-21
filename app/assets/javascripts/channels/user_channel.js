$(function() {
    $('[data-channel-subscribe="user"]').each(function(index, element) {
        var $element = $(element),
            user_id = $element.data('user-id')
        messageTemplate = $('[data-role="message-template"]');

        $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

        App.cable.subscriptions.create(
            {
                channel: "UserChannel",
                user: user_id
            },
            {
                received: function(data) {
                    //debugger
                    // let content = messageTemplate.children().clone(true, true);
                    // content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
                    // content.find('[data-role="message-text"]').text(data.message);
                    // content.find('[data-role="message-date"]').text(data.created_at);
                    // debugger
                    // if data.html
                    // {
                        $element.append(data.html);
                    // }
                    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
                    $(".chat-input").val("");
                }
            }
        );
    });
});
