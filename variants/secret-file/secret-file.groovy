import com.cloudbees.plugins.credentials.*;
import com.cloudbees.plugins.credentials.domains.Domain;
import org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl;
import java.nio.file.*;

Path fileLocation = Paths.get("/secret");

def secretBytes = SecretBytes.fromBytes(Files.readAllBytes(fileLocation))
def credentials = new FileCredentialsImpl(CredentialsScope.GLOBAL, 'secret', 'Secret file description', 'secretFile', secretBytes)

SystemCredentialsProvider.instance.store.addCredentials(Domain.global(), credentials)