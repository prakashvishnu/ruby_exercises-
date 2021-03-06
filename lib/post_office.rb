require 'sqlite3'
require 'csv'
require 'typhoeus'
require 'json'

class PostOffice

  def initialize(csv)
    @db = SQLite3::Database.new "postoffice.db"
    #@db.results_as_hash = true


    rows = @db.execute <<-SQL
      CREATE TABLE if not exists post_offices(
        officename varchar(30),
        pincode varchar(30),officeType varchar(30), Deliverystatus varchar(30), divisionname varchar(30),regionname varchar(30),
        circlename varchar(30),Taluk varchar(30),Districtname varchar(30),statename varchar(30),Telephone varchar(30),
        RelatedSuboffice varchar(30),
        Related Headoffice varchar(30),longitude varchar(30),latitude varchar(30)
        );
        SQL

    count = @db.execute("select count(*) from post_offices")
    if count ==[[0]]
      CSV.foreach(csv,headers: true) do |row|
        new_row = row.to_hash
        @db.execute 'insert into post_offices values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',new_row.values
      end
    end
      @count_na =  @db.execute("select count(*) from post_offices where latitude is 'NA' and longitude is 'NA'")[0][0]
      @count_lat =  @db.execute("select count(*) from post_offices where latitude is not 'NA' and longitude is not 'NA'")[0][0]
  end

  def find_post_office(count)
    if @count_na >= count
      @db.execute("select rowid,officename,Districtname,pincode from post_offices where longitude = ? and latitude = ? limit #{count}","NA","NA") do |row|
        id = row[0]
        name = row[1].split(/[^0-9A-Za-z]/).join
        dist = row[2]
        pin = row[3]
        find_lat_long(name,dist,pin)
        @db.execute("UPDATE post_offices set longitude = #{@lon},latitude = #{@lat} where rowid = ?","#{id}")

      end
    else
      print "There is no postoffices without lat and lon values"
    end
  end

  def find_lat_long(name,dist,pin)
    request = Typhoeus::Request.new("https://maps.googleapis.com/maps/api/geocode/json?address=#{name}+#{dist}+Kerala+#{pin}&key=AIzaSyBnIcyo9LYsvRVgGdqX0bxiCDwTAHbU2HE", followlocation: true)
    request.run
    result = request.response.body
    result_hash = JSON.parse(result)

    location = result_hash['results'][0]['geometry']['location']
    @lat = location["lat"].to_f
    @lon = location["lng"].to_f
    return @lat,@lon
  end

  public
  def show_updated_offices
    p @db.execute("select * from post_offices where latitude is not 'NA'")
  end

end


obj = PostOffice.new('kerala_po.csv')
obj.find_post_office(1)
obj.show_updated_offices

