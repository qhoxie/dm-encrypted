require 'pathname'

require 'rubygems'
require 'rcrypt'

module DataMapper
  module Types
    dir = File.join(Pathname(__FILE__).dirname.expand_path, 'dm-encrypted').to_s

    autoload :Encrypted, File.join(dir, 'encrypted')
  end
end

