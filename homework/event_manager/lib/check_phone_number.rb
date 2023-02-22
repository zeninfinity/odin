require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def check_phone_number(phone)
  #If the phone number is 10 digits, assume that it is good
  phone=phone.delete("^0-9")
  if phone.size== 10
    return phone

  #If the phone number is 11 digits and the first number is 1, trim the 1 and use the remaining 10 digits
  elsif phone.length== 11 && phone[0]=="1"
    return phone[1..-1]

  #If the phone number is less than 10 digits, assume that it is a bad number
  else
    return nil
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'Phone Checker initialized.'

contents = CSV.open(
  'data/event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone = row[:homephone]
  newphone=check_phone_number(phone)
  puts "#{id} #{name} #{phone} #{newphone}"

end
