class LaMetricService

  def self.push
    watson = Team.find_by(name: "watson")
    hal = Team.find_by(name: "hal")
    push_data = {
      "frames" => [
        {
          "index" => 0,
          "text" => "#{watson.current_score} - #{hal.current_score}",
          "icon" => "a917"
        }
      ]
    }.to_json

    base_url = "https://developer.lametric.com/api"
    push_url = "/V1/dev/widget/update/com.lametric.9eb497cb50960481f75db6f5d059ca0d/1"

    lametric_client(base_url).post push_url, push_data
  end

  private

  def self.lametric_client(url)
    @client ||= Faraday.new(:url => url) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Access-Token'] = 'YzFjNDYwMzM1NTgxYTRlOTRhMDAzZDQ2ZTNiNmQ4NDEzZDMzMjk3NTY5N2ZmZTFhMWMyODc3ZmQ2NDcwYzNmNA=='
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
