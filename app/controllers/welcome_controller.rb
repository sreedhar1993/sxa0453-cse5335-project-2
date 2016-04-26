class WelcomeController < ApplicationController
  def index
  end
  def getData
    db = Mongo::Client.new([ 'ds021691.mlab.com:21691' ],:database =>'heroku_t6hlk097',:user=>'sreedhar',:password=>'sreedhar')
    id=params[:id]

    db[:heroku_t6hlk097].find('unique' => id).each {|data1|

      render json:data1


    }


  end

end
