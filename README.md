# certbot-dns-scripts
scripts for Certbot DNS validation

They only work with [dynu.com](dynu.com) API.
## howto
Put your apikey in... the apikey file. **THIS MUST BE KEPT SECRET**
Put authenticator.sh and cleanup.sh somewhere. (these are not confidential) 
Make a cron job for running this command:
```shell
certbot certonly --manual --preferred-challenges=dns --manual-auth-hook /path/to/authenticator.sh --manual-cleanup-hook /path/to/cleanup.sh -d yourdomain.com
```
or for readability in nano:
```shell
certbot certonly --manual --preferred-challenges=dns\
--manual-auth-hook /path/to/authenticator.sh\
--manual-cleanup-hook /path/to/cleanup.sh\
-d yourdomain.com
```
