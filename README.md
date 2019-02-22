[![logo](./logo.jpg)](https://inforit.nl)

# bitbucket-pipelines

Docker image to automate mono builds on bitbucket using pipelines.

builds: https://hub.docker.com/r/inforitnl/cake-node-build/

# Instructions:

1. update dockerfile
2. build local version:

    ```sh
    docker build -t inforitnl/cake-node-build .
    ```

3. push new version to dockerhub:

    ```sh
    docker push inforitnl/cake-node-build
    ```

4. tag and push again (optional but recommended):

    ```sh
    docker tag inforitnl/cake-node-build inforitnl/cake-node-build:1
    docker push inforitnl/cake-node-build:1
    ```

# Usage

```sh
image: inforitnl/cake-node-build

pipelines:
  default:
    - step:
        script:
          - dotnet cake
```

# scripts

| Command | Description                         |
| ------- | ----------------------------------- |
| build   | build the container with latest tag |
| push    | pushes the container                |
