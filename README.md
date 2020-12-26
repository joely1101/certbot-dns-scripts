# certbot-dns-scripts
scripts for Certbot DNS validation

They only work with [dynu.com](dynu.com) API.
## Important: READ THIS BEFORE CONTINUING
> Note that putting your fully DNS API credentials on your web server significantly increases the impact if that web server is hacked. Best practice is to use more narrowly scoped API credentials, or perform DNS validation from a separate server and automatically copy certificates to your web server.

https://letsencrypt.org/docs/challenge-types/#dns-01-challenge

## howto
Put your apikey in... the apikey file. **THIS MUST BE KEPT SECRET!** If someone gets it, regenerate it from the User Control Panel.

Put authenticator.sh and cleanup.sh somewhere. (these are not confidential) 

Make a cron job for running this command:

```bash
certbot certonly --manual --preferred-challenges=dns --manual-auth-hook /path/to/authenticator.sh --manual-cleanup-hook /path/to/cleanup.sh -d yourdomain.com
```

or for readability in nano:

```bash
certbot certonly --manual --preferred-challenges=dns\
--manual-auth-hook /path/to/authenticator.sh\
--manual-cleanup-hook /path/to/cleanup.sh\
-d yourdomain.com
```

## Future projects
I might decide to support OAuth2 someday, but for now, only API keys are supported.

However, if someone opens a pull request for OAuth2, I will definitely accept it.
