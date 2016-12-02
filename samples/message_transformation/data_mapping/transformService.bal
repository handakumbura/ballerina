package sample.message_transformation.data_mapping;

import ballerina.lang.message;
import ballerina.lang.json;

@Path ("/transform")
@Source (interface = "default_http_listener")
@Service (title = "TransformService", description = "Transforms the inbound message")
service transformService {

	@POST
	resource transform (message m) {
	    json<Person> in = m:getPayload(m);
	    //here type converter kicks in
	    json<Driver> out  = (json<Driver>)in;
	    m:setPayload(out);
	    reply m;
	}
}