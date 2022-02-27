# Dismissing Previous Flows via Closures

In this demo app on success, we want to dismiss the flow to the Home View Controller. On a failure, we simply want to navigate back one step. Here we are using MVC to keep things simple but for your own use case, it can be any architecture you or your team are using.

## Demo App Flow 

#### Presentation Flow
```mermaid
flowchart LR
  A[Home View Controller] --> B[Presents] --> C[Settings View Controller] --> D[Presents] --> E[Subscription Management View Controller];
```

#### Flow Expected on Success
```mermaid
flowchart LR
  A[Subscription Management View Controller] --> B[Dismiss to] -->  C[Settings View Controller];
  D[Settings View Controller] --> E[Dismiss to] --> F[Home View Controller];
```

#### Flow Expected on Failure
```mermaid
flowchart LR
  A[Subscription Management View Controller] --> B[Dismiss to] -->  C[Settings View Controller];
```
