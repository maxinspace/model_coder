# ModelCoder

Gem for encoding/decoding User/Lead information in urlsafe format.

## Installation

```ruby
gem 'model_coder'
```

## Documentation
Define in config/initializers/model_coder.rb entity definitions for encode/decode
```ruby
# config/initializers/model_coder.rb
module ModelCoder
  class Constants
    ID_FIELD = :token                 # token to for encoding
    EXTERNAL_NAMESPACE = 'ModelCoder' # Application namespace
  end

  class Decoder
    def user?
      token_type == 'user'
    end

    def client?
      token_type == 'client'
    end

    def admin?
      token_type == 'admin'
    end

    alias user_id token_id
    alias client_id token_id
    alias admin_id token_id
  end
end
```

### Encoding
```ruby
  ModelCoder.encode(User.last) => "mv7AAmdflb1wst6jjjfvmmkrnfg2gst3mjdwg5kpnffhkyrsgvw2s6rqfzsxssrqm3zh36dcnq7x1wsdj262s6kvgvgA35zsjyzfcnkmkrjgswkAjv527r5npjmvgml3jvlvk9smk8ng5t5xk25A5rddgvmwAvjtlfjAs75jnzjdky5hkvAA95kkgfrt2vtzj418ab5k5nvwgyyshkfAA95kknbn24mlqmjwdsmdcgj5gyytjjfzAs6lmnn2wA66zjzvfkncnl1yc7"
```
### Decoding
```ruby
  ModelCoder.decode(token).user? => true
  ModelCoder.decode(token).client? => false
  ModelCoder.decode(token).user_id => '242b29ba-7b59-40e5-9dcf-4b425c077203'
  ModelCoder.decode(token).model => #<User id: 593249>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maximlarionov/model_coder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
