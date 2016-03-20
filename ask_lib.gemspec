Gem::Specification.new do |s|
  s.name        = 'ask_lib'
  s.version     = '0.0.0'
  s.date        = '2016-03-20'
  s.summary     = 'Alexa Skills Kit library.'
  s.description = 'A simple library for the Alexa Skills Kit API.'
  s.authors     = ['Pat McGee']
  s.email       = 'patmcgee331@gmail.com'
  s.files       = `git ls-files -- *.rb`.split("\n")
  s.test_files  = `git ls-files -- {spec}/*`.split("\n")
  s.license     = 'MIT'
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.4'
end
