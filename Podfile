platform :ios, '13.0'

def core
  pod 'Swinject', '~> 2.7'
  pod 'RxSwift', '~> 5.1'
  pod 'RxCocoa', '~> 5.1'
end

def network
  pod 'Alamofire', '~> 5.3'
  pod 'RxAlamofire', '~> 5.6'
end

def thirdparty
  pod 'Nuke', '~> 9.1'
  pod 'XLPagerTabStrip', '~> 9.0'
end

def testing
  pod 'Quick', '~> 3.0'
  pod 'Nimble', '~> 9.0'
end

target 'Movie' do
  use_frameworks!

  core
  network
  thirdparty

  target 'MovieTests' do
    inherit! :search_paths

    testing
  end
end
