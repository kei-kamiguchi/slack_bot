json.extract! chatbot, :id, :name, :message, :created_at, :updated_at
json.url chatbot_url(chatbot, format: :json)
