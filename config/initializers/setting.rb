class Settings < Settingslogic
  source "#{Rails.root}/config/e2s.yml"
  namespace Rails.env
end