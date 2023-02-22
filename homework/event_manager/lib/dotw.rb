require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def check_phone_numbers(phone)
  #If the phone number is 10 digits, assume that it is good
  if phone.length == 10
    return phone

  #If the phone number is 11 digits and the first number is 1, trim the 1 and use the remaining 10 digits
  elsif phone.length == 11 && phone[0]==1
    return phone[1..-1]

  #If the phone number is less than 10 digits, assume that it is a bad number
  else
    return false
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

puts 'DOTW initialized.'

contents = CSV.open(
  'data/event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

@dotw=[]
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  regdate = row[:regdate]

  time = Time.strptime(regdate, "%m/%d/%Y %k:%M")
  dotw= time.wday 
  @dotw.append(dotw)

end

for i in 0 .. 6
  puts "#{i} #{@dotw.count(i)}"
end
