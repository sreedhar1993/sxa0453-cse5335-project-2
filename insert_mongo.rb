require 'mongo'
require 'csv'
require 'json'
require 'open-uri'


begin
    db = Mongo::Client.new([ 'ds021691.mlab.com:21691' ],:database =>'heroku_t6hlk097',:user=>'sreedhar',:password=>'sreedhar');
    result = JSON.parse(open("http://chhs.data.ca.gov/resource/486w-i5jv.json?$limit=120&$offset=120").read)
    $i=1
    while $i < 110 do
        n = db[:heroku_t6hlk097].insert_one({
                                                unique: "#{$i}",
                                                brandname: result[$i]['brandname'],
                                                chemicalname: result[$i]['chemicalname'],
                                                companyname: result[$i]['companyname'],
                                                category: result[$i]['primarycategory'],
                                                productname: result[$i]['productname']
                                            })
        $i+=1
    end

    puts "Data Stored in MongoDB database successfully.............."



    puts "Enter the unique primary key to retrieve the data.."
    $uni=gets.chomp
    db[:heroku_t6hlk097].find('unique' => $uni).each {|data1|
        puts data1 }




end