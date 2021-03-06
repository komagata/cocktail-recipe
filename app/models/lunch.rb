class Lunch < ApplicationRecord
  belongs_to :user
  has_one :topic, dependent: :destroy
  has_many :invitations
  has_many :invitees, through: :invitations, source: :user
  validates :state, presence: true

  enum state: {scheduled: 0, done: 1, canceled: 2}

  def invite(invitee)
    invitations.create(user: invitee)
  end
end
