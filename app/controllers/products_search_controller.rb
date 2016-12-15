class ProductsSearchController < ApplicationController

  # Your AWS Access Key ID, as taken from the AWS Your Account page
  AWS_ACCESS_KEY_ID = ENV["AWS_ACCESS_KEY_ID"]

  # Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
  AWS_SECRET_KEY = ENV["AWS_SECRET_KEY"]

  # The region you are interested in
  ENDPOINT = "webservices.amazon.co.uk"
  REQUEST_URI = "/onca/xml"

  def search_products

    query_string = params[:query]

    params = {
      "Service" => "AWSECommerceService",
      "Operation" => "ItemSearch",
      "AWSAccessKeyId" => "AKIAI54F7XKGBTXAS4EQ",
      "AssociateTag" => "mygarden08-21",
      "SearchIndex" => "HomeGarden",
      "Keywords" => query_string,
      "ResponseGroup" => "Images,ItemAttributes,Offers",
      "Sort" => "salesrank"
    }

    # Set current timestamp if not set
    params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")

    # Generate the canonical query
    canonical_query_string = params.sort.collect do |key, value|
      [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')

    # Generate the string to be signed
    string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"

    # Generate the signature required by the Product Advertising API
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), AWS_SECRET_KEY, string_to_sign)).strip()

    # Generate the signed URL
    request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

    puts "Signed URL: \"#{request_url}\""

    response = HTTParty.get(request_url);

    @results = response;
    render json: @results
  end
end
