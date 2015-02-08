Pod::Spec.new do |s|
  s.name = 'SpinningRefreshControl'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Simple customizable spinning refresh control.'
  s.homepage = 'https://github.com/konkab/SpinningRefreshControl'
  s.authors = { 'Konstantin Kabanov' => 'konstantin@rktstudio.ru' }
  s.source = { :git => 'https://github.com/konkab/SpinningRefreshControl.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.source_files = 'SpinningRefreshControl.swift'
end
