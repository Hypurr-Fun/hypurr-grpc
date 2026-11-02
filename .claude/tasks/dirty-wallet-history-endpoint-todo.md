# Dirty wallet endpoint

Spec: [[dirty-wallet-history-endpoint-spec]]

- [x] Use execution-minute ranges and all pending wallets in one response without pagination or cursors.
- [x] Add `DirtyWalletsRequest`, `DirtyWalletsResponse`, and `HyperCore.DirtyWallets` in the protobuf.
- [x] Validate protobuf compilation and encode/decode. The 70,000-address response is 3,080,000 bytes.
- [x] The user generated and pushed Go, TypeScript, and Python bindings in `b371300`.
- [x] Build hl-indexer with module version `v0.0.0-20260909103027-b3713003140c`.
- [x] Add the ClickHouse range query and permanent boundary, duplicate, cancellation, and read-failure tests.
- [x] Add the RPC handler with range validation, retention checks, and sorted unique addresses from storage and pending memory.
- [x] Add permanent RPC tests for range bounds, default end time, retention, duplicates, empty results, and query errors.
- [x] Test nonempty pending collection, retries, and concurrent flushes in the indexer package.
- [x] Block DirtyWallets through the public gRPC-web interceptor and add its permanent regression test.

> [!info] Final verification — 2026-09-09
> The hl-indexer race suite passed with local ClickHouse: `253 passed, 0 failed, 4 skipped`.
> The four skips are existing manual replay and stream tests. Build, Go vet, formatting, and diff checks passed.
> RPC tests use an empty pending set. Indexer tests cover nonempty pending sets and concurrent flushes.

The hl-indexer plan records commands and remaining source scope:
`/Users/greg/code/go/hl-indexer/.claude/tasks/dirty-wallet-history-todo.md`.
Deployment and remote RPC tests were not performed during final verification.
