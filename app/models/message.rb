class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  scope :custom_display, -> { order(:created_at).last(20) }      #只顯示最後20筆聊天資料
end
