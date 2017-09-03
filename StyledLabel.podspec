Pod::Spec.new do |s|
  s.name             = 'StyledLabel'
  s.version          = '2.2'
  s.license          = 'MIT'
  s.summary          = 'StyledLabel is a UILabel with styling options'
  s.homepage         = 'https://github.com/mjrehder/StyledLabel.git'
  s.authors          = { 'Martin Jacob Rehder' => 'gitrepocon01@rehsco.com' }
  s.source           = { :git => 'https://github.com/mjrehder/StyledLabel.git', :tag => s.version }
  s.ios.deployment_target = '10.0'

  #s.dependency 'DynamicColor'
  
  s.framework    = 'UIKit'
  s.source_files = 'StyledLabel/*.swift'
  s.requires_arc = true
end
