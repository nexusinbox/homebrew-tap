# NexusInbox Homebrew tap

Installs `nexusinbox`, which connects this computer to a NexusInbox agent:
the signer daemon that keeps the agent's keys here, and the gateway AI
tools talk to.

```sh
brew install nexusinbox/tap/nexusinbox
nexusinbox connect <code>     # the pairing code the web app shows
```

Later: `nexusinbox start|stop|status <folder shown when it connected>`.
Update with `brew upgrade nexusinbox`; nothing updates by itself.

The formula installs the release archives of
[nexusinbox/nexusinbox](https://github.com/nexusinbox/nexusinbox/releases),
pinned by SHA-256. Each archive also has a build provenance attestation:

```sh
gh attestation verify <archive> --repo nexusinbox/nexusinbox
```
