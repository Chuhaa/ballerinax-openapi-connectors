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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [Ronin API v1](https://www.roninapp.com/api) OpenAPI specification.
# Ronin is a full featured time tracking and invoicing application. It allows you to easily manage almost all aspects of your online projects, though it has a focus on the billing side.
@display {label: "Ronin", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Ronin account](https://www.roninapp.com) and obtain tokens by following [this guide](https://www.roninapp.com/api).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get all clients
    #
    # + page - Specifies the page of clients to retrieve. 
    # + updatedSince - Filter by update time for clients. 
    # + sort - You can get the most recently created clients by date, rather than the default sort which is based on client name. 
    # + return - An object with a property clients which is an array of Client objects. 
    remote isolated function listClients(int? page = (), string? updatedSince = (), string? sort = ()) returns Clients|error {
        string path = string `/api/v2/clients.json`;
        map<anydata> queryParam = {"page": page, "updated_since": updatedSince, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Clients response = check self.clientEp->get(path, targetType = Clients);
        return response;
    }
    # Creates a new client. Clients represent companies, groups, organizations or other contact containers. All contacts must belong to a client. Clients are also the main containers for Projects and Invoices.
    #
    # + payload - The data required to create a client. 
    # + return - Created client 
    remote isolated function createClient(CreateClientRequest payload) returns ClientObject|error {
        string path = string `/api/v2/clients.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClientObject response = check self.clientEp->post(path, request, targetType = ClientObject);
        return response;
    }
    # Get a client.
    #
    # + id - The client ID 
    # + return - A client object 
    remote isolated function getClient(string id) returns ClientObject|error {
        string path = string `/api/v2/clients/${id}.json`;
        ClientObject response = check self.clientEp->get(path, targetType = ClientObject);
        return response;
    }
    # Get all contacts specific to a client
    #
    # + clientId - The client ID 
    # + page - Specifies the page of contacts to retrieve. 
    # + pageSize - You may also use a different page_size parameter. The maximum allowed page_size is 100. 
    # + return - An object with a property contacts which is an array of Contact objects. 
    remote isolated function listContactsByClient(string clientId, int? page = (), string? pageSize = ()) returns Contacts|error {
        string path = string `/api/v2/clients/${clientId}/contacts.json`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp->get(path, targetType = Contacts);
        return response;
    }
    # Creates a new contact. Contacts represent individuals belonging to Clients. In many cases, if a Contact is a Client, the Contact is where the email and other important information for the client whereas the Client is just a shell container.
    #
    # + clientId - The client ID 
    # + payload - The data required to create a contact. 
    # + return - Created contact 
    remote isolated function createContact(string clientId, CreateContactRequest payload) returns Contact|error {
        string path = string `/api/v2/clients/${clientId}/contacts.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Contact response = check self.clientEp->post(path, request, targetType = Contact);
        return response;
    }
    # Get all contacts
    #
    # + page - Specifies the page of contacts to retrieve. 
    # + pageSize - You may also use a different page_size parameter. The maximum allowed page_size is 100. 
    # + return - An object with a property contacts which is an array of Contact objects. 
    remote isolated function listContacts(int? page = (), string? pageSize = ()) returns Contacts|error {
        string path = string `/api/v2/contacts.json`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        Contacts response = check self.clientEp->get(path, targetType = Contacts);
        return response;
    }
    # Get a contact.
    #
    # + id - The contact ID 
    # + return - A contact object 
    remote isolated function getContact(string id) returns Contact|error {
        string path = string `/api/v2/contacts/${id}.json`;
        Contact response = check self.clientEp->get(path, targetType = Contact);
        return response;
    }
    # Get all estimates
    #
    # + page - Specifies the page of clients to retrieve. 
    # + return - An object with a property estimates which is an array of Estimate objects. 
    remote isolated function listEstimates(int? page = ()) returns Estimates|error {
        string path = string `/api/v2/estimates.json`;
        map<anydata> queryParam = {"page": page};
        path = path + check getPathForQueryParam(queryParam);
        Estimates response = check self.clientEp->get(path, targetType = Estimates);
        return response;
    }
    # Creates a new estimate. Estimates serve as proposals or quotes to be sent to Clients.
    #
    # + payload - The data required to create an estimate. 
    # + return - Created estimate 
    remote isolated function createEstimate(CreateEstimateRequest payload) returns Estimate|error {
        string path = string `/api/v2/estimates.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Estimate response = check self.clientEp->post(path, request, targetType = Estimate);
        return response;
    }
    # Get an estimate.
    #
    # + id - The estimate ID 
    # + return - An estimate object 
    remote isolated function getEstimate(string id) returns Estimate|error {
        string path = string `/api/v2/estimates/${id}.json`;
        Estimate response = check self.clientEp->get(path, targetType = Estimate);
        return response;
    }
    # Get all invoices
    #
    # + page - Specifies the page of invoices to retrieve. 
    # + updatedSince - Filter by update time for invoices. 
    # + return - An object with a property invoices which is an array of Invoice objects. 
    remote isolated function listInvoices(int? page = (), string? updatedSince = ()) returns Invoices|error {
        string path = string `/api/v2/invoices.json`;
        map<anydata> queryParam = {"page": page, "updated_since": updatedSince};
        path = path + check getPathForQueryParam(queryParam);
        Invoices response = check self.clientEp->get(path, targetType = Invoices);
        return response;
    }
    # Creates a new invoice. Ronin provides programmatic access to invoices and invoice items.
    #
    # + payload - The data required to create an invoice. 
    # + return - Created invoice 
    remote isolated function createInvoice(CreateInvoiceRequest payload) returns Invoice|error {
        string path = string `/api/v2/invoices.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Invoice response = check self.clientEp->post(path, request, targetType = Invoice);
        return response;
    }
    # Get a invoice.
    #
    # + id - The invoice ID 
    # + return - An invoice object 
    remote isolated function getInvoice(string id) returns Invoice|error {
        string path = string `/api/v2/invoices/${id}.json`;
        Invoice response = check self.clientEp->get(path, targetType = Invoice);
        return response;
    }
    # Get all projects
    #
    # + page - Specifies the page of projects to retrieve. 
    # + filter - By default, this end point will only return active and billable projects. To also retrieve closed projects, use the filter parameter with value all. 
    # + return - An object with a property projects which is an array of Project objects. 
    remote isolated function listProjects(int? page = (), string? filter = ()) returns Projects|error {
        string path = string `/api/v2/projects.json`;
        map<anydata> queryParam = {"page": page, "filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        Projects response = check self.clientEp->get(path, targetType = Projects);
        return response;
    }
    # Creates a new project. Projects represent hubs of work, tasks, logged hours, expenses, and invoices related to a Client.
    #
    # + payload - The data required to create a project. 
    # + return - Created project 
    remote isolated function createProject(CreateProjectRequest payload) returns Project|error {
        string path = string `/api/v2/projects.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, targetType = Project);
        return response;
    }
    # Get a project.
    #
    # + id - The project ID 
    # + return - An project object 
    remote isolated function getProject(string id) returns Projects|error {
        string path = string `/api/v2/projects/${id}.json`;
        Projects response = check self.clientEp->get(path, targetType = Projects);
        return response;
    }
    # Get all tasks
    #
    # + return - An object with a property tasks which is an array of Task objects. 
    remote isolated function listTasks() returns Tasks|error {
        string path = string `/api/v2/task.json`;
        Tasks response = check self.clientEp->get(path, targetType = Tasks);
        return response;
    }
    # Creates a new task. Tasks are TODO items that can be added to projects and assigned to staff members.
    #
    # + payload - The data required to create a task. 
    # + return - Created task 
    remote isolated function createTask(CreateTaskRequest payload) returns Task|error {
        string path = string `/api/v2/task.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Task response = check self.clientEp->post(path, request, targetType = Task);
        return response;
    }
    # Get a task.
    #
    # + id - The task ID 
    # + return - An task object 
    remote isolated function getTask(string id) returns Task|error {
        string path = string `/api/v2/tasks/${id}.json`;
        Task response = check self.clientEp->get(path, targetType = Task);
        return response;
    }
    # Updates a new task. Tasks are TODO items that can be added to projects and assigned to staff members.
    #
    # + id - The task ID 
    # + payload - The data required to update a task. 
    # + return - An empty body if the task was successfully updated. 
    remote isolated function updateTask(string id, UpdateTaskRequest payload) returns http:Response|error {
        string path = string `/api/v2/tasks/${id}.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType = http:Response);
        return response;
    }
}
