import ballerina/net.http;
import ballerinax/docker;

@docker:Config{}
endpoint http:ServiceEndpoint helloWorldEP {
    port:9090
};

@http:ServiceConfig {
    basePath:"/helloWorld"
}

service<http:Service> helloWorld bind helloWorldEP {
    sayHello (endpoint outboundEP, http:Request request) {
        http:Response response = {};
        response.setStringPayload("Hello, World from service helloWorld ! ");
        _ = outboundEP -> respond(response);
    }
}