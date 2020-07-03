## Skalena Recipes - WSO2 01

Target Recipes:
* Simple API
* Benchmarks
* API Façade Samples 

Please refer to this content in terms of pre-requirements: 

## Building

Clone the recipes repo:

    git clone https://github.com/skalena/recipes

Go to this folder sample: `wso2-ei-micro-01/skalena-recipes` and from there open the Visual Studio, you can type `code .` , if your Visual Studio is well-configured.

### Building the Project and Docker Image (EI Microintegrator)

Simple type: `./buildDockerImage.sh`  , done. 

### Running the Docker Image  (EI Microintegrator)

Simple type: `./runDockerImage.sh`  , done. 
The execution will show something like:

    ....... Running Docker image now ....
    f7d0daadb9d5f682699ae9850e68c0c0d6a35c3078ab65e99ad1ad7d391cda09

### Handling Docker

In order to know which containers are running, you can type: `docker ps` .  Then you will see a console output like similar to this:
docker ps

    CONTAINER ID  IMAGE  COMMAND  CREATED STATUS  PORTS  NAMES
    
    [here will be your id] skalena:recipe-ei-01 "/home/wso2carbon/do…" 41 seconds ago  Up 40 seconds 0.0.0.0:8290->8290/tcp, 8253/tcp, 0.0.0.0:9164->9164/tcp jovial_blackwell

In order to see the logs you have to execute `docker logs -f <your-container-id-execution>` 

And then you will see the logs pretty much like this: 

    $ docker logs -f f7d0daadb9d5
    
    [2020-07-03 05:10:02,204]  INFO {org.apache.synapse.deployers.SequenceDeployer} - Sequence named 'provider-acme' has been deployed from file : /home/wso2carbon/wso2mi-1.1.0/tmp/carbonapps/-1234/1593753002167skalena-recipes_1.0-SNAPSHOT.car/provider-acme.xml_1.0-SNAPSHOT/provider-acme.xml-1.0-SNAPSHOT.xml
    
    [2020-07-03 05:10:02,215]  INFO {org.apache.synapse.deployers.SequenceDeployer} - Sequence named 'provider-tabajara' has been deployed from file : /home/wso2carbon/wso2mi-1.1.0/tmp/carbonapps/-1234/1593753002167skalena-recipes_1.0-SNAPSHOT.car/provider-tabajara.xml_1.0-SNAPSHOT/provider-tabajara.xml-1.0-SNAPSHOT.xml
    
    [2020-07-03 05:10:02,221]  INFO {org.apache.synapse.deployers.SequenceDeployer} - Sequence named 'sequence-fault-facade' has been deployed from file : /home/wso2carbon/wso2mi-1.1.0/tmp/carbonapps/-1234/1593753002167skalena-recipes_1.0-SNAPSHOT.car/sequence-fault-facade.xml_1.0-SNAPSHOT/sequence-fault-facade.xml-1.0-SNAPSHOT.xml
    
    [2020-07-03 05:10:02,241]  INFO {org.apache.synapse.rest.API} - Initializing API: simple_api
    
    [2020-07-03 05:10:02,242]  INFO {API_LOGGER.simple_api} - Initializing API: simple_api
    
    [2020-07-03 05:10:02,247]  INFO {org.apache.synapse.deployers.APIDeployer} - API named 'simple_api' has been deployed from file : /home/wso2carbon/wso2mi-1.1.0/tmp/carbonapps/-1234/1593753002167skalena-recipes_1.0-SNAPSHOT.car/simple_api_1.0-SNAPSHOT/simple_api-1.0-SNAPSHOT.xml
    
    [2020-07-03 05:10:02,275]  INFO {org.apache.synapse.rest.API} - Initializing API: facade
    
    [2020-07-03 05:10:02,276]  INFO {API_LOGGER.facade} - Initializing API: facade
    
    [2020-07-03 05:10:02,277]  INFO {org.apache.synapse.core.axis2.Axis2SynapseEnvironment} - Continuation call is set to true
    
    [2020-07-03 05:10:02,278]  INFO {org.apache.synapse.deployers.APIDeployer} - API named 'facade' has been deployed from file : /home/wso2carbon/wso2mi-1.1.0/tmp/carbonapps/-1234/1593753002167skalena-recipes_1.0-SNAPSHOT.car/facade_1.0-SNAPSHOT/facade-1.0-SNAPSHOT.xml
    
    [2020-07-03 05:10:02,279]  INFO {org.wso2.micro.integrator.initializer.deployment.application.deployer.CAppDeploymentManager} - Successfully Deployed Carbon Application : skalena-recipesCompositeApplication_1.0-SNAPSHOT{super-tenant}
    
    [2020-07-03 05:10:02,339]  INFO {org.apache.synapse.transport.passthru.core.PassThroughListeningIOReactorManager} - Pass-through HTTP Listener started on 0.0.0.0:8290
    
    [2020-07-03 05:10:02,339]  INFO {org.apache.axis2.transport.mail.MailTransportListener} - MAILTO listener started
    
    [2020-07-03 05:10:02,343]  INFO {org.apache.synapse.transport.passthru.core.PassThroughListeningIOReactorManager} - Pass-through HTTPS Listener started on 0.0.0.0:8253
    
    [2020-07-03 05:10:02,345]  INFO {org.wso2.micro.integrator.initializer.StartupFinalizer} - WSO2 Micro Integrator started in 9 seconds
    
    [2020-07-03 05:10:02,415]  WARN {org.wso2.micro.integrator.management.apis.ManagementInternalApi} - Micro Integrator Management REST API is enabled
    
    [2020-07-03 05:10:02,487]  INFO {org.apache.synapse.transport.passthru.core.PassThroughListeningIOReactorManager} - Pass-through EI_INTERNAL_HTTPS_INBOUND_ENDPOINT Listener started on 0.0.0.0:9164

## Testing

Now let's test our stuff,  first, let's try the simple_api API call: 

    curl http://localhost:8290/simple_api -v 

Response:
    
    * Connected to localhost (::1) port 8290 (#0)
    
    > GET /simple_api HTTP/1.1
    
    > Host: localhost:8290
    
    > User-Agent: curl/7.64.1
    
    > Accept: */*
 
    < HTTP/1.1 200 OK
    
    < Accept: */*
    
    < Access-Control-Allow-Methods: GET
    
    < Host: localhost:8290
    
    < Access-Control-Allow-Headers:
    
    < Content-Type: application/json; charset=UTF-8
    
    < Date: Fri, 03 Jul 2020 05:16:03 GMT
    
    < Transfer-Encoding: chunked
    
    * Connection #0 to host localhost left intact
    
    {"message":{"msg":" That is the message back from WSO2 Micro EI at 2020-07-03T05:16:03 "}}* 

### API Façade

Now , let's execute the API Façade via API URI parameter (provider==acme): `curl http://localhost:8290/api-facade/provider/acme -v`

Reponse: 

    < HTTP/1.1 200 OK
    < Accept: */*   
    < Access-Control-Allow-Methods: GET   
    < Host: localhost:8290   
    < Access-Control-Allow-Headers    
    < Content-Type: application/json; charset=UTF-8   
    < Connection: Close   
    < Date: Fri, 03 Jul 2020 05:18:47 GMT  
    < Transfer-Encoding: chunked
    * Closing connection 0
    
    {"resultado":{"msg":"ACME"}}

Now, let's execute passing the provider via HTTP Header: 

    curl http://localhost:8290/api-facade/provider -v -H "X-Skalena-Provider:acme"

Response: 

    > X-Skalena-Provider:acme
    < HTTP/1.1 200 OK
    < Accept: */*
    < Access-Control-Allow-Methods: GET
    < X-Skalena-Provider: acme
    < Host: localhost:8290
    < Access-Control-Allow-Headers:
    < Content-Type: application/json; charset=UTF-8
    < Date: Fri, 03 Jul 2020 05:22:38 GMT
    < Transfer-Encoding: chunked
    {"resultado":{"msg":"ACME"}}

Now, let's simulate a call where the provider does not exists:

    curl http://localhost:8290/api-facade/provider -v -H "X-Skalena-Provider:mesbla"

Response: 

    > X-Skalena-Provider:mesbla
    < HTTP/1.1 404 Provider not found!
    < api-error-client: Provider not found, please refer to an existing one and see the logs
    < Accept: */*
    < Access-Control-Allow-Methods: GET
    < X-Skalena-Provider: mesbla
    < Host: localhost:8290
    < Access-Control-Allow-Headers:
    < Content-Type: application/json; charset=UTF-8
    < Date: Fri, 03 Jul 2020 05:24:08 GMT
    
    Connection #0 to host localhost left intact
    
    {"error":{"msg":"Sequence named Value {name ='null', expression =get-property('provider')} cannot be found","provider":"provider-mesbla"}}* 

### Benchmark 

Please, just call the shell script: ./benchmark.sh , and that's all, you will see 1000 calls with 100 concurrents clients, you will a result like that: 

    This is ApacheBench, Version 2.3 <$Revision: 1843412 $>
    
    Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
    
    Licensed to The Apache Software Foundation, http://www.apache.org/

    Benchmarking localhost (be patient)

    Server Software:
    
    Server Hostname: localhost
    
    Server Port: 8290
 
    Document Path: /simple_api
    
    Document Length: 90 bytes
 
    Concurrency Level: 100
    
    Time taken for tests: 10.802 seconds
    
    Complete requests: 1000
    
    Failed requests: 0
    
    Total transferred: 314000 bytes
    
    HTML transferred: 90000 bytes
    
    Requests per second: 92.58 [#/sec] (mean)
    
    Time per request: 1080.181 [ms] (mean)
    
    Time per request: 10.802 [ms] (mean, across all concurrent requests)
    
    Transfer rate: 28.39 [Kbytes/sec] received
 
    Connection Times (ms)
    
    min mean[+/-sd] median max
    
    Connect: 0 1 1.4 0 6
    
    Processing: 7 1045 338.2 1175 1498
    
    Waiting: 7 1044 338.2 1173 1498
    
    Total: 7 1045 337.8 1175 1498

    Percentage of the requests served within a certain time (ms)
    
    50% 1175
    
    66% 1254
    
    75% 1269
    
    80% 1280
    
    90% 1338
    
    95% 1443
    
    98% 1480
    
    99% 1492
    
    100% 1498 (longest request)

Happy coding, and the reference recipe is here: 

[https://skalena.github.io/api-methodology/public/cont/wso2/](https://skalena.github.io/api-methodology/public/cont/wso2/)