import ballerina/http;
import ballerinax/ai.agent;

listener agent:Listener personalAiAssistantListener = new (listenOn = check http:getDefaultListener());

service /personalAiAssistant on personalAiAssistantListener {
    resource function post chat(@http:Payload agent:ChatReqMessage request) returns agent:ChatRespMessage|error {
        string agentResponse = check personalAiAssistantAgent->run(request.message);
        return {message: agentResponse};
    }
}
