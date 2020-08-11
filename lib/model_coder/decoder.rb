module ModelCoder
  class Decoder
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def id
      decode['id']
    end

    def user?
      token_type == 'user'
    end

    def token_id
      decode['token_id']
    end

    alias user_id token_id

    def model(using: :slave)
      return if model_class.nil?
      model_scope(using).find_by(find_by_field.to_sym => token_id)
    end

    private

    def find_by_field
      decode['field'] || ID_FIELD
    end

    def model_scope(using)
      return model_class unless model_class.respond_to?(:using)
      model_class.using(using)
    end

    def model_class
      return nil if token_type.nil?
      classified_token_type = token_type.classify
      [classified_token_type, [EXTERNAL_NAMESPACE, classified_token_type].join('::')].map do |name|
        name.safe_constantize
      end.compact.first
    end

    def token_type
      decode['type']
    end

    def decode
      JWT.decode(unencrypt, nil, false).first rescue {}
    end

    def unencrypt
      Base64.urlsafe_decode64(token)
    rescue ArgumentError
      URLcrypt.decode(token)
    end
  end
end
