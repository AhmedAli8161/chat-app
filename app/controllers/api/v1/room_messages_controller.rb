module Api
  module V1
    class RoomMessagesController < ApplicationController
      # skip_before_action :authenticate_user!, only: [:api, :do_stuff]
      before_action :authenticate_user!, except: [:wit_ai]
      def wit_ai
        message = RoomMessage.find(params[:id]).message
        access_token = 'LEHXHHZTLWYZG7H3ULXGU4LF3VCB32GS'
        client = Wit.new(access_token: access_token)
        resp = client.message(message)


     #   render json: {status: 'SUCCESS', message: 'Wit in Action', data: resp  },status: :ok
      end

    end
  end
end
