# frozen_string_literal: true

require_relative "lib/img2pdf/version"

Gem::Specification.new do |spec|
  spec.name = "img2pdf"
  spec.version = Img2pdf::VERSION
  spec.authors = ["Steffen Roller"]
  spec.email = ["steffen.roller@gmail.com"]

  spec.summary = "Combine a directory with JPG into a PDF document"
  spec.description = "The GEM uses pdftex to combine all JPG files in a directory into a PDF document. It needs a properly installed LaTeX/pdflatex distribution."
  spec.homepage = "https://github.com/sroller/img2pdf"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sroller/img2pdf"
  spec.metadata["changelog_uri"] = "https://github.com/sroller/img2pdf/raw/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "thor"
  spec.add_development_dependency "gem-release"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
