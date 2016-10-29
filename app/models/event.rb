class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :user_id
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming(search = '')
  	Event.where('ends_at > ? and lower(name) like ? and is_published=true', Time.now, "%#{search.downcase}%")
  end
end
