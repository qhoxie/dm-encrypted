dm-encrypted
======
A [DataMapper](http://github.com/datamapper/data_mapper)
[type](http://github.com/datamapper/dm-more/tree/master/dm-types) that supports
RSA encrypted columns.

Installation
------------
    gem install rcrypt dm-encrypted --source http://gemcutter.org

Usage
-----
Private and public key constants need to be set:

    PRIVATE_KEY = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpgI..."
    PUBLIC_KEY = "-----BEGIN RSA PUBLIC KEY-----\nXLPBCgK..."

In your models, you simply specify the column type as Encrypted:

    class Account
      include DataMapper::Resource

      property :id,         Serial
      property :username,   String
      property :password,   Encrypted
    end

Saving and loading those fields will transparently work with plaintext:

    >> Account.create :username => "me", :password => "secret"
    >> Account.first.password
    => "secret"

However it is ciphertext in the database:

    >> select password from accounts;
    => qxZjz37mt2PU...tcHPf5Un3RGAyxaT==

Comments/Suggestions/Requests
----------------------------
Email me: qhoxie on gmail.com

Copyright
---------
Copyright (c) 2009 Quin Hoxie. See LICENSE for details.
