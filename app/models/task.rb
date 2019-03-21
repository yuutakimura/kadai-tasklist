class Task < ApplicationRecord
    validates :content, presence: true, length: { maxmum: 255 }
    validates :status, presence: ture, length: { maxmum: 255 }
end
