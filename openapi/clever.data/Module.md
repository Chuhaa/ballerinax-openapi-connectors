## Overview
Ballerina connector for Clever Data is connecting the [Clever Data API](https://dev.clever.com/v1.2/docs/secure-sync) via Ballerina language easily. It  provides the information retrieval functionality of Clever.

This module supports Clever Data API version 1.2.

## Configuring connector
### Obtaining tokens

Follow the [document](https://dev.clever.com/v1.2/docs/getting-started) to obtain tokens.
 
## Quickstart

### Step 1: Import Clever Data module
First, import the ballerinax/clever.data module into the Ballerina project.
```ballerina
import ballerinax/clever.data;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the bearer token config.

```ballerina
data:ClientConfig configuration = {
    authConfig: {
        token : "<TOKEN>"
    }
};

data:Client cleverClient = check new (configuration);
```

### Step 3: Get legal entity
Following is code demonstrates how to get contacts using `ballerinax/clever.data` connector.

```ballerina
public function main() returns error? {
    data:StudentContactsResponse response = check cleverClient->getContacts();
}
```
