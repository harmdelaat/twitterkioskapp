# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

["blindX", "blindY", "blindZ", "cover", "curtainX", "curtainY", "fade", "fadeZoom", "growX", "growY", "none", "scrollUp", "scrollDown", "scrollLeft", "scrollRight", "scrollHorz", "scrollVert", "shuffle", "slideX", "slideY", "toss", "turnUp", "turnDown", "turnLeft", "turnRight", "uncover", "wipe", "zoom"].each do |fx_name|
  Fx.create(:name => fx_name)
end