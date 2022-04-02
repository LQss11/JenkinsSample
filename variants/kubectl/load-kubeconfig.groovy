import com.cloudbees.plugins.credentials.*;
import com.cloudbees.plugins.credentials.domains.Domain;
import org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl;
import java.nio.file.*;

Path fileLocation = Paths.get("/kube/config");

def secretBytes = SecretBytes.fromBytes(Files.readAllBytes(fileLocation))
def credentials = new FileCredentialsImpl(CredentialsScope.GLOBAL, 'kube', 'Kubernetes config file for kubernetes credentials access', 'kubeconfigfil', secretBytes)

SystemCredentialsProvider.instance.store.addCredentials(Domain.global(), credentials)