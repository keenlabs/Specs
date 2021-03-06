Pod::Spec.new do |s|
  s.name = 'FMDB'
  s.version = '2.0'
  s.summary = 'A Cocoa / Objective-C wrapper around SQLite.'
  s.homepage = 'https://github.com/ccgus/fmdb'
  s.license = 'MIT'
  s.author = { 'August Mueller' => 'gus@flyingmeat.com' }
  s.source = { :git => 'https://github.com/ccgus/fmdb.git',
                 :tag => 'v2.0' }

  s.default_subspec = 'standard'

  s.subspec 'common' do |ss|
    ss.source_files = 'src/FM*.{h,m}'
    ss.exclude_files = 'src/fmdb.m'
  end

  # use a builtin version of sqlite3
  s.subspec 'standard' do |ss|
    ss.library = 'sqlite3'
    ss.dependency 'FMDB/common'
  end

  # use a custom built version of sqlite3, with FTS4 enabled
  s.subspec 'standalone' do |ss|
    ss.dependency 'sqlite3/fts'
    ss.dependency 'FMDB/common'
  end

  s.requires_arc = false
end
