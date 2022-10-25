# DevTools - Docker Image for Development

This is a collection of tools for development. 

## Tools

- yq - v4.26.1 - YAML processor
- stern - v1.11.0 - Tail multiple pods & containers on Kubernetes
- helm - v2.17.0 - The Kubernetes Package Manager
- kops - v1.12.1 - Kubernetes Operations
- kubectl - v1.12.10 - Kubernetes command-line tool
- autoscaler - v1.12.10 - Cluster Autoscaler
- aws-cli - v2.8.5 - AWS Command Line Interface
- Node.js - v16.18.0 - JavaScript runtime
- npm - v8.19.2 - Package manager for JavaScript
- Pulumi - v3.43.1 - Cloud engineering platform

## Usage

### From Docker Hub

1. Create a docker-compose.yml file with the following content:

```yaml
version: '3.1'

services:

  devtools:
    container_name: devtools
    image: jhonwg/devtools:1.12.10-v1
    restart: always
```
2. Run the following command:

```bash
docker-compose up -d
```
3. Run the following command to enter the container:

```bash
docker exec -it devtools bash
```
4. Ready to use!

### From GitHub

1. Clone the repository:

```bash
git clone https://github.com/jhonwgo/devtools.git
```
2. Run the following command:

```bash
cd devtools
```
3. Compile the image:

```bash
docker build -t devtools .
```
4. Run the following command:
```bash
docker-compose up -d
```
5. Run the following command to enter the container:

```bash
docker exec -it devtools bash
```
6. Ready to use!

