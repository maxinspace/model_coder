module ModelCoder
  class Encoder
    attr_reader :model, :find_by_field

    def initialize(model, field:)
      @model = model
      @find_by_field = field || ModelCoder::Constants::ID_FIELD
    end

    def token
      shorten
    end

    private

    def model_class
      model.class.name.downcase
    end

    def model_id
      return unless model.respond_to?(find_by_field)
      model.public_send(find_by_field).to_s
    end

    def encode
      JWT.encode({ token_id: model_id, type: model_class, field: find_by_field, id: model.id }, nil, 'none')
    end

    def shorten
      Base64.urlsafe_encode64(encode)
    end
  end
end
