# NemID

NemID is a Ruby gem that makes it easy to integrate the NemID JavaScript client with ruby applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nemid'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nemid

## Usage

This gem implements the following modules:

- `Authentication:` generate client initialization parameters and response handling.

- `PIDCPR:` match PID to a CPR number. Match and translation are available only to selected service providers.

- `OCSP:` use this if you want to manually perform an OCSP request.

### Authentication::Parameters

Generate client initialization parameters

```ruby
nemid = NemID::Authentication::Parameters.new(
  'path/to/your/voces/certificate',
  'your_voces_certificate_password',
)

nemid.client_initialization_parameters # ruby hash with signed parameters
```

### Authentication::Response

Parse and validate NemID response, then extract user information from certificate. As of this version, it is only possible to extract the PID (or RID).

```ruby
response = NemID::Authentication::Response.new(base64_str) # Base64 string from NemID

# or

response = NemID::Authentication::Response.new(xml_str) # XML string from NemID

# First, validate NemID response, as stated in NemID Documentation

begin
  response.validate_response
rescue NemID::Errors::ResponseValidationError => e
  puts e # Developer-friendly message, example: Signature is invalid.
end

# Note that response.validate_response raises exceptions instead of returning true or false, the exceptions are raised according to the order that the  methods are invoked. The following methods perform the same validations and do not raise exceptions:

response.valid_signature? # true
response.valid_certificate_chain? # true
response.user_certificate_expired? # false
response.user_certificate_revoked? # false

# If response is valid, then proceed to extract user information:

# Extract PID or RID
response.extract_pid_or_rid # "PID:9208-2002-2-316380231171"

# Has PID?
response.has_pid? # true

# Extract PID
response.extract_pid # "9208-2002-2-316380231171"

# Has RID?
response.has_rid? # false

# Extract RID
response.extract_rid # nil
```

### PIDCPR

Match a PID to a CPR number.

```ruby
pid_cpr = NemID::PIDCPR.new(
  'your_service_provider_id',
  'path/to/your/voces/certificate',
  'your_voces_certificate_password'
)

pid_cpr.match(pid: '9208-2002-2-316380231171', cpr: '2205943423')

# Expected result - success
true

# Expected result - failure
false

# To complete:
# - how is the error going to be handled? raising a class error?
```

### OCSP

An OCSP request is performed when the `.validate_response` or `.user_certificate_revoked?` methods are invoked. If you wish to perform the OCSP request yourself, to catch specific OCSP errors, you can do it this way:

```ruby
user_certificate = OpenSSL::X509::Certificate.new(raw) # User's certificate

issuer = OpenSSL::X509::Certificate.new(raw) # The issuer of the user's certificate (Normally the intermediate certificate)

ca = OpenSSL::X509::Certificate.new(raw) # Certificate Authority

ocsp = NemID::OCSP
ocsp.request(
  subject: user_certificate,
  issuer: issuer,
  ca: ca
) # Returns +true+ if the certificate status is revoked or unknown, +false+ if the certificate status is OK.

# Catching OCSP errors:

# This implementation raises the following OCSP errors, be sure to catch them so the execution of your program is not interrupted.

begin
  ocsp.request(
    subject: user_certificate,
    issuer: issuer,
    ca: ca
  )
rescue NemID::OCSP::Error 
  # Catches all OCSP errors
rescue NemID::OCSP::InvalidSignatureError => e
  # If you get a failure here you may be missing the intermediate certificates.
  puts e # Response is not signed by a trusted certificate
rescue NemID::OCSP::NoStatusError => e
  # Means that we could not extract the status information for the certificate from the basic response
  puts e # basic_response does not have the status for the certificate
rescue NemID::OCSP::InvalidUpdateError => e
  # A status issued in the future must be rejected.
  puts e # this_update is in the future or next_update time has passed
rescue NemID::OCSP::NonceError => e
  # Adding a nonce to the request protects against replay attacks but not all CA process the nonce.
  # Therefore, this implementation only checks if the both nonces are present and not equal
  puts e # Nonces both present and not equal
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davideluque/nemid. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/davideluque/nemid/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NemID project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/davideluque/nemid/blob/master/CODE_OF_CONDUCT.md).
