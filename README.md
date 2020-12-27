# warning
I am working on the README. It is incomplete.

# certbot-dns-scripts
scripts for Certbot DNS validation

They only work with [dynu.com](dynu.com) API.
## Important: READ THIS BEFORE CONTINUING
> Note that putting your fully \[sic\] DNS API credentials on your web server significantly increases the impact if that web server is hacked. Best practice is to use more narrowly scoped API credentials, or perform DNS validation from a separate server and automatically copy certificates to your web server.

https://letsencrypt.org/docs/challenge-types/#dns-01-challenge

## howto
### Needed things
1. API key
2. ID of the TXT record

#### API key

User Control Panel -> API credentials -> find the API key, **not the OAuth2 one**

Put your apikey in... the apikey file. **THIS MUST BE KEPT SECRET!** If someone gets it, regenerate it from the User Control Panel.
#### TXT record ID extraction

If not already done, make a TXT record (for 3rd level domains, wait 31 days) with node name _acme-challenge.

Find its ID with this command: 

```bash 
curl -X GET https://api.dynu.com/v2/dns/record/_acme-challenge.[your hostname].com\?recordType\=TXT\
        -H "accept: application/json" \
        -H "API-Key: [redacted]"
```
Find the line that contains "id" and the one that contains domain_id.

Then, dump "id" into the "txt_id" file and "domain_id" into the "domain_id" file.

We are now done with the preparation.

Put authenticator.sh, cleanup.sh, txt_id,(<== chmod 600 this) somewhere. 

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


Add automatic copying of certs over ssh or make a script for that.
