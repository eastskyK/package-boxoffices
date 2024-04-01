Pod::Spec.new do |spec|

  spec.name         = "BoxOfficesK"
  spec.version      = "1.0.0"
  spec.summary      = "영화 진흥위원회에서 제공하는 API를 활용해 영화 관련 정보를 가져옵니다."

  spec.description  = <<-DESC
	BoxOffices 는 영화진흥위원회 에서 제공하는 API를 통해 영화 관련 정보들을 쉽게 가져올 수 있게 합니다.
                   DESC

  spec.homepage     = "https://github.com/eastskyK/package-boxoffices"

  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  spec.author             = { "Dongho" => "eastsky21@gmail.com" }


  spec.ios.deployment_target = "15.0"
  spec.swift_version = "5.9"


  spec.source       = { :git => "https://github.com/eastskyK/package-boxoffices.git", :tag => "#{spec.version}" }


  spec.source_files  = "Sources/BoxOffices/**/*"


end
