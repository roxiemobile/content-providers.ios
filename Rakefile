# coding: utf-8
base_dir = File.expand_path('..', __FILE__)

$:.unshift base_dir
require 'bundler'
Dir.glob(File.join(base_dir, 'Tasks', '**', '*.rb'), &method(:require))

FRAMEWORK ||= RoxieMobile::Framework.new(
  name: 'ContentProviders',
  base_dir: base_dir,
  projects: [
    'FileSystem',
    'SQLite',
    'UserDefaults'
  ]
)

desc 'Bump all versions to match FRAMEWORK_VERSION.'
task :update_version => 'all:update_version'
