# License

See the accompanying LICENSE file.

# About

as3couchdb-air is an extension of the [as3couchdb project](http://github.com/bustardcelly/as3couchdb) (an ActionScript 3 clientside API for interacting with a CouchDB instance)
that takes advantage of the capabilities provided in the Adobe AIR Platform.

# Requirements

The following libraries are required to compile the as3couchdb library project:

## as3couchdb

The as3couchdb-air library is built against the [standalone version](http://github.com/bustardcelly/as3couchdb/tree/master/bin/standalone/) of [as3couchdb](http://github.com/bustardcelly/as3couchdb).

# Usage 

The purpose of the as3couchdb-air project is to build upon the [as3couchdb library](http://github.com/bustardcelly/as3couchdb) while utilizing the desktop capabilites provided in the Adobe AIR Platform.
With this, the CouchDB communication layer and API is very much the same as is described in for the as3couchdb project on the [wiki](http://wiki.github.com/bustardcelly/as3couchdb/).

One important layer of communication is addressed with the as3couchdb-air library: Requests. Due to the limitation of HTTP request methods (as well as HTTP Header Response receipts) 
from the web version of Flash Player, the [as3httpclientlib](http://code.google.com/p/as3httpclientlib) is used when working with the [as3couchdb](http://github.com/bustardcelly/as3couchdb) library.
Communication with a CouchDB instance is essentially bridged through a Socket, allowing for standard HTTP requests and Header responses.

The HTTP request and header response restriction found in the web version of Flash Player is opened and accessible when working with the Desktop Flash Player provided from Adobe AIR runtime.
As such, the as3couchdb-air library provides some additional RequestType objects to eschew the use of a Socket and make requests and handle header response directly from within the
target application. These classes are:
  
    AIRCouchRequest
    AIRCouchRequestSession

The use of these classes is just the same as how you declare the RequestType for the business layer in custom annotations described on the [wiki](http://wiki.github.com/bustardcelly/as3couchdb/custom-annotations) for the [as3couchdb](http://github.com/bustardcelly/as3couchdb) project.
Please visit [CustomAnnotations](http://wiki.github.com/bustardcelly/as3couchdb/custom-annotations) section from the [wiki](http://wiki.github.com/bustardcelly/as3couchdb/custom-annotations) for [as3couchdb](http://github.com/bustardcelly/as3couchdb).