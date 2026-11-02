# iOS Live Asset Price Batch Plan

Specification: [[ios-live-asset-update-batch-spec]]

Status: Awaiting revised approval

## Approval

- [ ] Approve the unchanged RPC name and request type.
- [ ] Approve `stream LiveAssetPriceUpdates` as the response.
- [ ] Approve `repeated LiveAssetPriceUpdate updates = 1`.
- [ ] Approve direct item fields with numbers `1`, `2`, and `3`.
- [ ] Approve removal of the three superseded message types.
- [ ] Approve generated binding changes.
- [ ] Approve this revised plan.

## Implementation

- [ ] Change the RPC response type in `hypurr/ios.proto`.
- [ ] Replace the old update messages with the price batch messages.
- [ ] Stop and wait for review of `hypurr/ios.proto`.
- [ ] Regenerate the Go binding and stop for review.
- [ ] Regenerate the TypeScript binding and stop for review.
- [ ] Regenerate the Python binding and stop for review.

> [!note]
> The user waived the pseudocode gate.

> [!note]
> The gRPC companion files will change because the RPC response type changes.

## Verification

- [ ] Compile `hypurr/ios.proto`.
- [ ] Run `go test ./...`.
- [ ] Run `go build ./...`.
- [ ] Run the available TypeScript check if one exists.
- [ ] Import the generated Python module.
- [ ] Run `git diff --check`.
- [ ] Quote the command output before completion.
