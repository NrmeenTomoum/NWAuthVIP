Pod::Spec.new do |spec|

  spec.name         = "NWAuthVIP"
  spec.version      = "1.1.0"
  spec.summary      = "NWAuthVIP"
 spec.swift_version = '5.0'

  spec.description  = "NWAuthVIP is NEtWork Layer and Authentication and VIP Architecture"

  spec.homepage     = "https://github.com/NrmeenTomoum/NWAuthVIP"

   spec.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2018
                   Permission is granted to...
                  LICENSE
                }

  spec.author             = { "Nermeen" => "nrmeen.tomoum@alumni.fci-cu.edu.eg" }

    spec.platform     = :ios, "12.2"
 spec.dependency 'Alamofire', '~> 5.0.0-beta.5'

  spec.source       = { :git => "https://github.com/NrmeenTomoum/NWAuthVIP.git", :tag => "1.1.0" }

  spec.source_files  = "NWAuthVIP/**/*.{h,m,swift}"

end
