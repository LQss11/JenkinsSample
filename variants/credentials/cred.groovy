////https://support.cloudbees.com/hc/en-us/articles/217708168-Creating-credentials-using-Groovy

import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.*

def env = System.getenv()
Credentials cred = (Credentials) new UsernamePasswordCredentialsImpl(CredentialsScope.GLOBAL,env.ID, "Description", env.USER, env.PASSWORD)
SystemCredentialsProvider.getInstance().getStore().addCredentials(Domain.global(), cred)