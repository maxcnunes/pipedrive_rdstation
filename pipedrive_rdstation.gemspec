Gem::Specification.new do |s|
  s.name        = 'pipedrive_rdstation'
  s.version     = '0.0.1'
  s.date        = '2013-08-12'
  s.summary     = "RD Station Pipedrive!"
  s.description = "A simple gem for import Person data from RD Station to Pipedrive"
  s.authors     = ["Max Claus Nunes"]
  s.email       = 'maxcnunes@gmail.com'
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  
  s.add_dependency('httparty')
  
  s.homepage    = 'https://github.com/maxcnunes/pipedrive_rdstation'
  s.license     = 'MIT'
end