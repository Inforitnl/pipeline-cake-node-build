[![logo](./logo.jpg)](https://inforit.nl)

# bitbucket-pipelines

Docker image to automate mono builds on bitbucket using pipelines.

builds: https://hub.docker.com/r/inforitnl/cake-build/

# Instructions:

1. update dockerfile
2. build local version:

    ```
    docker build -t inforitnl/cake-build .
    ```
3. push new version to dockerhub:

    ```
    docker push inforitnl/cake-build
    ```
4. tag and push again (optional but recommended):

    ```
    docker tag inforitnl/cake-build inforitnl/cake-build:1
    docker push inforitnl/cake-build:1
    ```

# Usage

```
image: inforitnl/cake-build

pipelines:
  default:
    - step:
        script:
          - ./build.sh
```

# scripts

| Command | Description                         |
|---------|-------------------------------------|
|  build  | build the container with latest tag |
|  push   | pushes the container                |