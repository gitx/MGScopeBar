Pod::Spec.new do |s|
  s.name         = "MGScopeBar"
  s.version      = "1.0.0"
  s.summary      = 'MGScopeBar is a control which provides a "scope bar" or "filter bar", much like that found in iTunes, the Finder (in the Find/Spotlight window), and Mail.'
  s.homepage     = "http://mattgemmell.com/mgscopebar/"
  s.license      = { :file => 'Source Code License.rtf' }
  s.author       = { "Matt Gemmell" => "matt@mattgemmell.com" }
  s.source       = { :git => "https://github.com/chbeer/MGScopeBar.git", :tag => s.version.to_s }
  
  s.platform     = :osx
  s.osx.deployment_target = '10.7'

  s.source_files  = '*.{h,m}'
  s.exclude_files = 'main.m, AppController.{h,m}'
  s.requires_arc  = false
end
