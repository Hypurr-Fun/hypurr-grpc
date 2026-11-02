> [!note]
> Superseded by the timestamp-precision implementation in hypurr-bot. The request fields and indexer lookup were removed.

# Start indexer pages after a PG close

Spec: [[closed-position-indexer-start-spec]].

- [x] Inspect protocol, database queries, and callers.
- [x] Describe the approved single-request design.
- [x] Add request fields and regenerate bindings.
- [x] Add indexer lookup and request validation.
- [x] Simplify the bot reader and controller request.
- [x] Update and run pagination tests, builds, vet, and formatting checks.

Validation used temporary module files pointing to the local protocol checkout:
- Indexer RPC tests: `ok gitlab.com/hypurr/hl-indexer/rpc 0.558s`.
- Indexer close-query tests: `ok gitlab.com/hypurr/hl-indexer/database 0.438s`.
- Bot history tests: `ok command-line-arguments 0.550s`.
- Bot controller tests: `ok gitlab.com/hypurr/hypurr-bot/controllers 0.742s`.
- Indexer build/vet and isolated bot history build/vet passed.
- Protocol generation and Go package check passed. Python request round-trip passed.
- Formatting and diff checks passed in all three repositories.
- Full bot build remains blocked by missing user-stream definitions.

Release work remains outside this code change:
- [ ] Publish the protocol and update its version in both consumer go.mod files.
- [ ] Deploy the indexer before the bot. An older indexer ignores the new request fields.
