/**
 * <p>Original Author: toddanderson</p>
 * <p>Class File: AIRCouchSessionRequest.as</p>
 * <p>Version: 0.1</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 */
package com.custardbelly.as3couchdb.service
{
	import com.adobe.serialization.json.JSON;
	import com.custardbelly.as3couchdb.core.CouchServiceFault;
	import com.custardbelly.as3couchdb.enum.CouchHeaderType;
	import com.custardbelly.as3couchdb.event.CouchEvent;
	import com.custardbelly.as3couchdb.net.CouchSessionResponse;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequestHeader;
	
	/**
	 * AIRCouchSessionRequest is an extension of the base AIRCouchRequest that knows how to handle session related data, such as headers and status. 
	 * @author toddanderson
	 */
	public class AIRCouchSessionRequest extends AIRCouchRequest
	{
		protected var _status:int;
		protected var _sessionCookie:String;
		
		/**
		 * Constructor.
		 */
		public function AIRCouchSessionRequest() { super(); }
		
		/**
		 * @inherit
		 */
		override protected function handleResponseComplete( evt:Event ):void
		{
			var result:String = ( evt.target as URLLoader ).data.toString();
			// If the response has shown up empty, notify of fault.
			if( result.length > 0 )
			{
				respondToResult( CouchEvent.RESULT, new CouchSessionResponse( _sessionCookie, JSON.decode( result ) ) );
			}
			else
			{
				// Assign relative message based on receipt of cookie.
				var message:String = ( _sessionCookie ) ? "Session created, but notifcation of complete not received." : "Session could not be created.";
				respondToFault( CouchEvent.FAULT, _status, message );
			}
		}
		
		/**
		 * @inherit
		 */
		override protected function handleHTTPResponseStatus( evt:HTTPStatusEvent ):void
		{
			// Cycle through response headers and see if we can find a cookie.
			_status = evt.status;
			var headers:Array = evt.responseHeaders;
			var i:int = headers.length;
			var header:URLRequestHeader;
			while( --i > -1 )
			{
				header = headers[i] as URLRequestHeader;
				if( header.name == CouchHeaderType.SESSION_COOKIE )
				{
					_sessionCookie = header.value;
					break;
				}
			}
		}
	}
}