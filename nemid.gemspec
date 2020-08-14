Gem::Specification.new do |s|
  s.name        = 'nemid'
  s.version     = '0.0.0'
  s.licenses    = []
  s.summary     = "This is an example!"
  s.description = "Much longer explanation of the example!"
  s.authors     = ["David Cabeza"]
  s.email       = 'cabezadavide@gmail.com'
  s.files       = [
                    "lib/nemid.rb",
                    "lib/nemid/crypto.rb",
                    "lib/nemid/login.rb",
                    "lib/nemid/pid_cpr.rb"
                  ]
  s.homepage    = 'https://github.com/davideluque/nemid'
  s.metadata    = { "source_code_uri" => "https://github.com/davideluque/nemid" }

  s.add_runtime_dependency 'openssl', '~> 2.2', '>= 2.2.0'
  s.add_runtime_dependency 'savon', '~> 2.12.0', '>=2.12.0'
end