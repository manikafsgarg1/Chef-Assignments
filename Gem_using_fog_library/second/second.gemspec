
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'second/version'
# require_relative "second"

Gem::Specification.new do |spec|
  spec.name          = 'second'
  spec.version       = Second::VERSION
  spec.authors       = ['manikafsgarg']
  spec.email         = ['manik.garg@msystechnologies.com']

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # spec.files = ['lib/second.rb', 'lib/second/connection.rb', 'lib/second/ami_list.rb', 'lib/second/server_list.rb']
  spec.files = `git ls-files -z`.split("\x0").reject{ |f| f.include?('second-0.1.0.gem') }
  # spec.files = Dir['lib/   *.rb']
  # spec.files += Dir['[A-Z]*'] + Dir['test/**/*']
  # spec.files.reject! { |fn| fn.include? "CVS" }
  # Dir['lib/*'].map{|i| puts i.ins}
  # spec.files = Dir['lib/*'].reject{ |f| f.include?('git') }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'chef',  '>= 12.2.1'
  spec.add_development_dependency 'aws-sdk'
  spec.add_development_dependency 'fog-aws'
end
