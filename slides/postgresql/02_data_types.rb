require 'active_record'

ActiveRecord::Base.establish_connection(
  host:     'localhost',
  port:     '5434',
  adapter:  'postgresql',
  pool:     '5',
  timeout:  '5000',
  encoding: 'unicode',
  username: 'postgres',
  password: 'postgres',
  database: 'pg_demo_93'
)

class DemoArray < ActiveRecord::Base
  self.table_name = "_02_data_types.demo_array"
  self.primary_key = false
end

class DemoComplex < ActiveRecord::Base
  self.table_name = "_02_data_types.demo_complex"
  self.primary_key = false
end

print "-----------------------------------------\n"
print "Array demo values:\n"
print "-----------------------------------------\n"
DemoArray.all.each do |x| 
  print x.val
  print "\n"
end

print "-----------------------------------------\n"
print "Complex demo values:\n"
print "-----------------------------------------\n"
DemoComplex.all.each do |x| 
  print x.val
  print "\n"
end

r = DemoArray.new
r.val = (45..67).to_a
r.save