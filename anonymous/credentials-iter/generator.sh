#!/bin/sh

# Remove back to line
sed 's/\r//g' $1
# Import packages
cat >/usr/share/jenkins/ref/init.groovy.d/test.groovy <<EOF
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.*

def env = System.getenv()

EOF

# Iterate through each file
for word in $(cat $1); do

# Object name
object=$(echo $word | cut -d "." -f1)
# id value
id=$(echo $word | cut -d "." -f2)
# username value
username=$(echo $word | cut -d "." -f3)
# Password value
password=$(echo $word | cut -d "." -f4)


echo "Credentials $object = (Credentials) new UsernamePasswordCredentialsImpl(CredentialsScope.GLOBAL,\"$id\", \"Description\", \"$username\", \"$password\")
SystemCredentialsProvider.getInstance().getStore().addCredentials(Domain.global(), $object)

">>/usr/share/jenkins/ref/init.groovy.d/test.groovy
done
