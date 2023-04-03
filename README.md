# Psibase CLI Image

This image allows you to run the Psibase cli tool on your local machine through docker. This allows it to function regardless of OS.

If you are using this image locally, consider tagging the image with a more user-friendly name. For example:
`docker image tag ghcr.io/gofractally/psibase-cli:0.0.1 psibase` allows you to refer to the image with "psibase" instead of "ghcr.io/gofractally/psibase-cli:0.0.1".

You may remotely connect it to any running psinode instance using the `-a` flag, for example:

```
psibase -s <PRIV_KEY> -a http://<PSINODE_URL>:8080 create bob --key <PUBKEY> --sender alice
```
