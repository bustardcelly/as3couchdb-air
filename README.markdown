# License

See the accompanying LICENSE file.

# About

as3couchdb-air is an extension of the [http://github.com/bustardcelly/as3couchdb]as3couchdb project (an ActionScript 3 clientside API for interacting with a CouchDB instance)
that takes advantage of the capabilities provided in the Adobe AIR Platform.

# Requirements

The following libraries are required to compile the as3couchdb library project:

## as3couchdb

The as3couchdb-air library is built against the [http://github.com/bustardcelly/as3couchdb/tree/master/bin/standalone/]standalone version of [http://github.com/bustardcelly/as3couchdb]as3couchdb.

# Usage 

The purpose of the as3couchdb-air project is to build upon the [http://github.com/bustardcelly/as3couchdb]as3couchdb library while utilizing the desktop capabilites provided in the Adobe AIR Platform.
With this, the CouchDB communication layer and API is very much the same as is described in for the as3couchdb project on the [http://wiki.github.com/bustardcelly/as3couchdb/]wiki.

One important layer of communication is addressed with the as3couchdb-air library: Requests. Due to the limitation of HTTP request methods (as well as HTTP Header Response receipts) 
from the web version of Flash Player, the [http://code.google.com/p/as3httpclientlib]as3httpclientlib is used when working with the http://github.com/bustardcelly/as3couchdbas3couchdb library.
Communication with a CouchDB instance is essentially bridged through a Socket, allowing for standard HTTP requests and Header responses.

The HTTP request and header response restriction found in the web version of Flash Player is opened and accessible when working with the Desktop Flash Player provided from Adobe AIR runtime.
As such, the as3couchdb-air library provides some additional RequestType objects to eschew the use of a Socket and make requests and handle header response directly from within the
target application. These classes are:
  
    AIRCouchRequest
    AIRCouchRequestSession

The use of these classes is just the same as how you declare the RequestType for the business layer in custom annotations described on the [http://wiki.github.com/bustardcelly/as3couchdb/custom-annotations]wiki for the [http://github.com/bustardcelly/as3couchdb]as3couchdb project.
Please visit [http://wiki.github.com/bustardcelly/as3couchdb/custom-annotations]CustomAnnotations section from the [http://wiki.github.com/bustardcelly/as3couchdb/custom-annotations]wiki for [http://github.com/bustardcelly/as3couchdb]as3couchdb.