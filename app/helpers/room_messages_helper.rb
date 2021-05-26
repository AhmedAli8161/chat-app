module RoomMessagesHelper
  def message_for_bot(message)
    wit_service = WitService.new
    res = wit_service.send_message_to_wit(message)
    puts res
    # byebug
    keys = wit_service.get_keys_from_message(res)

    return keys
  end
end
