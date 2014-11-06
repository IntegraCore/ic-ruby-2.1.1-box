puts "CONFIG GIT"
print "Enter Full Name: " 
name = gets.chomp
puts name
print "Enter Email Address: "
email = gets.chomp
puts email
puts "git config --global user.email '#{email}'"
system "git config --global user.email '#{email}'"
puts "git config --global user.name '#{name}'"
system "git config --global user.name '#{name}'"
File.delete(__FILE__)


