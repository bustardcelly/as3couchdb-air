# About

The as3couchdb-air project generates library SWC and optimized SWF files into two output bins:

## standalone

The standalone bin contains the library SWC and optimized SWF that can be added to the library
of a project without the need of having the dependant [as3couchdb](http://github.com/bustardcelly/as3couchdb/) library and any other ancillary SWC libraries 
(as3corelib, as3crypto, as3httpclientlib) included in the project library. 
The standalone [as3couchdb-air swc](http://github.com/bustardcelly/as3couchdb/tree/master/bin/standalone/), compiles in the as3couchdb standalone library. 
As such, the file size for the standalone SWC is higher than the external library, as it has dependencies compiled in. 
If you are not worried about file size and/or you do not want to manage dependencies in your project library, 
use the standalone SWC or SWF.

## external

The external bin contains the library SWC and optimized SWF that is compiled against dependant SWC libraries:
[as3couchdb-air](http://github.com/bustardcelly/as3couchdb/tree/master/bin/standalone/). Included in the external SWC are only the source files 
from the as3couchdb-air library. As such, the file size for the external SWC is lower than the standalone
yet it is necessary to include the dependant libraries (as3couchdb, as3corelib, as3crypto, as3httpclientlib) within your project. If you are worried about
file size and/or are fine with managing library dependencies, use the external SWC or SWF.

# Dependencies

The as3couchdb library depends on the following libraries in order to compile:

## as3couchdb

The as3couchdb-air library is built against the [standalone version](http://github.com/bustardcelly/as3couchdb/tree/master/bin/standalone/) of [as3couchdb](http://github.com/bustardcelly/as3couchdb).

# Addition Dependencies

If you are using the external version of as3couchdb-air, you will likely require the following libraries in addition to the as3couchdb library:

## as3corelib

The as3couchdb library requires the as3corelib project (found at [http://code.google.com/p/as3corelib/](http://code.google.com/p/as3corelib/)).
The classes from the as3corelib project that as3couchdb utilizes is SHA1 for generating unique ids
on the client side, and JSON for serializing objects for CouchDB service communication.

## as3httpclient

The as3couchdb library requires the as3httpclient project (found at [http://code.google.com/p/as3httpclientlib](http://code.google.com/p/as3httpclientlib)).
as3couchdb utilizes the as3httpclient API to make proper PUT and DELETE requests on the CouchDB instance.
as3httpclient has a dependency on the following libraries: as3corelib and as3crypto.

## as3crypto

The as3crypto library is used by the as3httpclient (see above requirement).
as3crypt can be found at [http://code.google.com/p/as3crypto/](http://code.google.com/p/as3crypto/)