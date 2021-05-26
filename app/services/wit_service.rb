class WitService

  def initialize
    access_token = 'LEHXHHZTLWYZG7H3ULXGU4LF3VCB32GS'
    @client ||= Wit.new(access_token: access_token)
  end

  def send_message_to_wit(message='')
    @client.message(message)
  end

  def get_keys_from_message(wit_response)
    # json_response = JSON.parse(wit_response)
    entities = {}
    if wit_response["entities"].present?
      keys_data = wit_response["entities"]
      wit_response["entities"].keys.each do |entity_key|
        keys_data[entity_key].each do |entiy_data|
          entitiy_name = entiy_data["name"]
          entitiy_value = entiy_data["value"]

          entities[entitiy_name] = entitiy_value
        end
      end
    end

    return entities
  end
end
