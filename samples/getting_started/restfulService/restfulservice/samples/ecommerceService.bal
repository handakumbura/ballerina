package restfulservice.samples;

import ballerina.net.http;

@http:BasePath {value:"/ecommerceservice"}
service Ecommerce {
    //Based on the HTTP method of the request, a backend service is invoked and resultant response is returned to the client.
    //Path parameters are passed into the resource block using the PathParam annotation.
    http:ClientConnector productsService = create http:ClientConnector("http://localhost:9090");
    
    @http:GET{}
    @http:Path {value:"/products/{productId}"}
    resource productsInfo(message m, 
    @http:PathParam{value:"productId"} string prodId) {
        string reqPath = "/productsservice/" + prodId;
        message response = http:ClientConnector.get(productsService, reqPath, m);
        reply response;
    
    }
    
    @http:POST{}
    @http:Path {value:"/products"}
    resource productMgt (message m) {
        message response = http:ClientConnector.post(productsService, "/productsservice", m);
        reply response;
        
    }
    
    @http:GET{}
    @http:Path {value:"/orders"}
    resource ordersInfo (message m) {
        http:ClientConnector productsService = create http:ClientConnector("http://localhost:9090");
        message response = http:ClientConnector.get(productsService, "/orderservice/orders", m);
        reply response;
        
    }
    
    @http:POST{}
    @http:Path {value:"/orders"}
    resource ordersMgt (message m) {
        http:ClientConnector productsService = create http:ClientConnector("http://localhost:9090");
        message response = http:ClientConnector.post(productsService, "/orderservice/orders", m);
        reply response;
        
    }
    
    @http:GET{}
    @http:Path {value:"/customers"}
    resource customersInfo (message m) {
        http:ClientConnector productsService = create http:ClientConnector("http://localhost:9090");
        message response = http:ClientConnector.get(productsService, "/customerservice/customers", m);
        reply response;
        
    }
    
    @http:POST{}
    @http:Path {value:"/customers"}
    resource customerMgt (message m) {
        http:ClientConnector productsService = create http:ClientConnector("http://localhost:9090");
        message response = http:ClientConnector.post(productsService, "/customerservice/customers", m);
        reply response;
        
    }
    
}
