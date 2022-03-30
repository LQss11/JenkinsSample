# JenkinsSample
Jenkins image build and run without having to create initial user and configure initial plugins
# Behavior
Default plugins will be installed .

# Additional

# Env variables
To create a container using this image we will need to ensure that some env variables are set properly following your needs

- [ ] Add table template for env vars specified here:

To setup env vars on docker run:
```sh
docker run -it --rm -e VAR=value jenkinssample:latest bash
```