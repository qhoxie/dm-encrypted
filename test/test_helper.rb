require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'dm-core'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'dm-encrypted'

PUBLIC_KEY, PRIVATE_KEY = RCrypt.generate_key_pair.values

