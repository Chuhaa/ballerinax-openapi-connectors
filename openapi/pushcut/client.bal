// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API-Keys can be managed in the Account view of the Pushcut app.
    string apiKey;
|};

# This is a generated connector for [Pushcut API v1](https://www.pushcut.io/webapi.html) OpenAPI specification.
# API to send Pushcut notifications, execute Automation Server actions, and register custom webhooks as online actions.
@display {label: "Pushcut", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Pushcut account](https://www.pushcut.io) and obtain tokens by following [this guide](https://www.pushcut.io/help).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.pushcut.io/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get devices
    #
    # + return - Success 
    remote isolated function getDevices() returns InlineResponse200[]|error {
        string  path = string `/devices`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200[] response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200Arr);
        return response;
    }
    # Get defined notifications
    #
    # + return - Success 
    remote isolated function getNotifications() returns InlineResponse2001[]|error {
        string  path = string `/notifications`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001[] response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001Arr);
        return response;
    }
    # Send a smart notification
    #
    # + notificationName - Notification Name 
    # + payload - Extend and customize the defined notification by providing dynamic content. 
    # + return - Success 
    remote isolated function sendNotification(string notificationName, Notification payload) returns http:Response|error {
        string  path = string `/notifications/${notificationName}`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Get a list of all online action subscriptions
    #
    # + return - Success 
    remote isolated function getSubscriptions() returns SubscriptionData[]|error {
        string  path = string `/subscriptions`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SubscriptionData[] response = check self.clientEp-> get(path, accHeaders, targetType = SubscriptionDataArr);
        return response;
    }
    # Subscribe to an online action
    #
    # + payload - Subscription request 
    # + return - Success 
    remote isolated function actionExecuted(Subscription payload) returns InlineResponse2002|error {
        string  path = string `/subscriptions`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2002 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2002);
        return response;
    }
    # Remove an online action subscription
    #
    # + subscriptionId - Id that was returned when creating the subscription. 
    # + return - Success 
    remote isolated function deleteSubscription(string subscriptionId) returns http:Response|error {
        string  path = string `/subscriptions/${subscriptionId}`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Execute an Automation Server action.
    #
    # + shortcut - Shortcut 
    # + homekit - HomeKit scene 
    # + timeout - Timout in seconds, or 'nowait' 
    # + delay - Duration in which this request should be executed. Eg: 10s, 15m, 6h 
    # + identifier - Only used for delayed requests. Use an identifier to overwrite or cancel a scheduled execution. 
    # + payload - Pass an input or optional configuration with the request. 
    # + return - Success 
    remote isolated function execute(Execute payload, string? shortcut = (), string? homekit = (), string? timeout = (), string? delay = (), string? identifier = ()) returns http:Response|error {
        string  path = string `/execute`;
        map<anydata> queryParam = {"shortcut": shortcut, "homekit": homekit, "timeout": timeout, "delay": delay, "identifier": identifier};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Cancel a scheduled Automation Server action.
    #
    # + identifier - Identifier of the request. 
    # + return - Success 
    remote isolated function cancelExecution(string? identifier = ()) returns http:Response|error {
        string  path = string `/cancelExecution`;
        map<anydata> queryParam = {"identifier": identifier};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
}
