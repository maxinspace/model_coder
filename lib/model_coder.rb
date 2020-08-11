require "model_coder/version"
require 'jwt'
require 'active_support/core_ext/string'
require 'URLcrypt'

require 'model_coder/constants'
require 'model_coder/decoder'
require 'model_coder/encoder'

module ModelCoder
  class << self
    def encode(entity, field: nil)
      Encoder.new(entity, field: field).token
    end

    def decode(token)
      Decoder.new(token)
    end
  end
end
