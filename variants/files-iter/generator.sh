#!/bin/sh

#Import packages
cat >/usr/share/jenkins/ref/init.groovy.d/secretFiles.groovy <<EOF
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.Domain
import org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl
import java.nio.file.*

EOF


for FILE in /secret-files/*;do

    FILE_NAME=$(echo $FILE | cut -d '/' -f3)
    #echo $FILE_NAME | sed 's/[#$%*@]//g'

    FILE_NAME2=$(echo $FILE_NAME | sed "s/\.//g")
    #echo $FILE_NAME2
    
    echo "Path "$FILE_NAME2"Location = Paths.get('/secret-files/$FILE_NAME')

    def "$FILE_NAME2"Bytes = SecretBytes.fromBytes(Files.readAllBytes("$FILE_NAME2"Location))
    def "$FILE_NAME2"credentials = new FileCredentialsImpl(CredentialsScope.GLOBAL, '$FILE_NAME', 'Description', '$FILE_NAME', "$FILE_NAME2"Bytes)

    SystemCredentialsProvider.instance.store.addCredentials(Domain.global(), "$FILE_NAME2"credentials)
    " >> /usr/share/jenkins/ref/init.groovy.d/secretFiles.groovy

done