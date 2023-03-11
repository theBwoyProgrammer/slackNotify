class Api::V1::NotificationsController < ApplicationController
  def notify
    data = JSON.parse(request.body.read)
    if data['type'] == 'spam'
      email = data['email']
      message = "New spam notification from #{email}"
      client = Slack::Web::Client.new
      begin
        client.chat_postMessage(channel: '#notifications', text: message)
        render json: { success: true, message: "Slack notification sent: #{message}" }
      rescue Slack::Web::Api::Errors::SlackError => e
        render json: { success: false, message: "Error sending Slack notification: #{e.message}" }
      end
    else
      render json: { success: false, message: "Payload does not match desired criteria" }
    end
  end
end
