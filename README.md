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
docker run -it --rm -p 8080:8080 -e VAR=value jenkinssample:latest bash
```


### WIP
- [X] Work with 1 directory to accept argument whether admin or anonymous to chose on which base image to start
- [X] Github actions pipeline -> push to dockerhub on success
- [ ] Put relative files together to avoid having multiple files in same dir (Avoid confusion)


## Image variants
Some image variants ideas:

- [ ] Implement Configurations with JCasC plugin
- [ ] Setup Image to use kubernetes key to run kubectl commands
