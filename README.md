# NGINX Unit Python Demo
Demo for using Python with NGINX Unit

## Requirements
This demo leverages the [Task](https://taskfile.dev/#/) runner for ease of use.

## Build Unit Python Demo Container
```bash 
task build
```

or

```bash 
docker build -t unit_python_demo:latest .
```

## Run Unit Python Demo Container
```bash
task run
```

or 

```bash
docker run -d --mount type=bind,src="$(pwd)/config/",dst=/docker-entrypoint.d/  \
--mount type=bind,src="$(pwd)/log/unit.log",dst=/var/log/unit.log \
--mount type=bind,src="$(pwd)/state",dst=/var/lib/unit \
--mount type=bind,src="$(pwd)/webapp",dst=/www -p 8080:8080 \
--name unit_python_demo unit_python_demo:latest
```

## Configure Unit
```bash
task load_config
```

or

```bash
docker exec -ti unit_python_demo curl -X PUT --data-binary @/docker-entrypoint.d/config.json --unix-socket /var/run/control.unit.sock http://localhost/config
```

## Test 
```bash
task test
```

or 

```bash
curl -X GET localhost:8080
```