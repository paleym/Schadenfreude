#encoding: utf-8


And /^I select the date "([^"]*)" for "([^"]*)"$/ do |date, selection|
	date_parsed = Date.parse(date)
	select(date_parsed.year.to_s, :from => "user[#{selection}(1i)]")
	select(date_parsed.strftime("%B"), :from => "user[#{selection}(2i)]")
	select(date_parsed.day.to_s, :from => "user[#{selection}(3i)]")
end
