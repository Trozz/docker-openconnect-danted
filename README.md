# OpenConnect Danted
This repo contains an `openconnect` client running in Docker with `danted` for Proxy connections

## Environment Variables
| VAR  | EXAMPLE  |
|---|---|
| URL | `https://vpn.example.com` |
| PROTOCOL | `anyconnect` |
| USERNAME | `trozz` |
| PASSWORD | `Password or PIN` |

## Getting it running

```
docker run -td --cap-add=NET_ADMIN -e URL=https://vpn.example.com -e PROTOCOL=anyconnect -e USERNAME=trozz -e PASSWORD=**** trozz/openconnect-danted
```