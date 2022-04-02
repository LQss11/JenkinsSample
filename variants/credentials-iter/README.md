# Credentials-iter variant
Credentials-iter is the image variant of `lqss/jenkins` which allows a user to setup multiple credentials on startup.

# Setup
In order to load your environment variables you will need to create a file with multiple lines of this format:
```
OBJECT.ID.USERNAME.PASSWORD
```
|   | Unique | Usage |
| ------ | ------ | ------ |
| OBJECT | [X] | Value used for vars generator script, and might be useful to help you know  which object the variable belongs to. |
| ID | PREFERRED TO BE UNIQUE | credential id that could be used to reference values through pipeline. |
| USERNAME | [ ] | object username|
| PASSWORD | [ ] | object password|

## Quick start
Now that you have your file ready you can start the container by running:
```sh
docker run -it --rm -v <path-to-env-file>:data.env -p 9999:8080 jenkins:creds-iter   
```

You can then check your credentials here [http://localhost:9999/credentials/](http://localhost:9999/credentials/)`

# WIP
- [ ] fix issue in case a variable has same delimiter.
- [ ] SSL exception