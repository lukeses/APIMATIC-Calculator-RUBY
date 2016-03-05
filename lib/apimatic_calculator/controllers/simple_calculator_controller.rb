# This file was automatically generated by APIMATIC BETA v2.0 on 03/05/2016

module ApimaticCalculator
  class SimpleCalculatorController

    # Calculates the expression using the specified operation.
    # @param [OperationTypeEnum] operation Required parameter: The operator to apply on the variables
    # @param [Double] x Required parameter: The LHS value
    # @param [Double] y Required parameter: The RHS value
    # @return Double response from the API call
    def get_calculate operation, x, y
      # the base uri for api requests
      query_builder = Configuration.BASE_URI.dup

      # prepare query string for API call
      query_builder << "/{operation}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "operation" => operation,
      }

      # process optional query parameters
      query_builder = APIHelper.append_url_with_query_parameters query_builder, {
        "x" => x,
        "y" => y,
      }

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "APIMATIC 2.0"
      }

      # invoke the API call request to fetch the response
      response = Unirest.get query_url, headers:headers

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

  end
end