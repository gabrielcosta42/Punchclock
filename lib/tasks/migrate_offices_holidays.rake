namespace :migrate do
  desc 'migrate offices_regional_holidays regional_holidays to cities_regional_holidays'
  task offices_holidays_to_cities_holidays: :environment do
    ActiveRecord::Base.transaction do
      Office.all.each do |office|
        city = City.find_by!(name: office.city)

        office.regional_holidays.each do |holiday|
          city.regional_holidays.push(holiday)
          city.save!
        end
      end
    end
  end
end
