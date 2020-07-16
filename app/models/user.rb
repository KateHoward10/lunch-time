class User < ApplicationRecord
  belongs_to :organisation, optional: true

  def self.is_in_org(auth)
    !!(where(email: auth.info.email).first.try(:organisation_id?))
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.google_token = auth.credentials.token
      user.google_refresh_token = auth.credentials.refresh_token
    end
  end
end