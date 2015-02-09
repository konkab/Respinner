Pod::Spec.new do |s|
  s.name = 'Respinner'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Simple, customizable spinning refresh control written in Swift.'
  s.homepage = 'https://github.com/konkab/Respinner'
  s.authors = { 'Konstantin Kabanov' => 'konstantin@rktstudio.ru' }
  s.source = { :git => 'https://github.com/konkab/Respinner.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'Respinner.swift'
end
