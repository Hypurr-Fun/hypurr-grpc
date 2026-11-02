# iOS Live Asset Updates Proto Plan

Specification: [[ios-live-asset-updates-proto-spec]]

Status: Awaiting approval

## Approval

- [ ] Approve placement after `Home` in the service and message sections.
- [ ] Approve retention of `AssetDetailLiveUpdates`.
- [ ] Approve the proto-only scope.
- [ ] Approve this plan.

## Pseudocode Gate

- [ ] Show the proto pseudocode in chat.
- [ ] Include a line estimate for each section and the total.
- [ ] Stop and wait for sign-off before the proto edit.

## Implementation

- [ ] Add `LiveAssetUpdates` after `Home` in `IosService`.
- [ ] Add the matching message section after the Home definitions.
- [ ] Use the field names and numbers from issue 18.
- [ ] Stop and wait for review before any other file change.

## Verification

- [ ] Compile `hypurr/ios.proto` to a temporary descriptor.
- [ ] Run `go test ./...`.
- [ ] Run `go build ./...`.
- [ ] Run `git diff --check`.
- [ ] Quote the relevant command output before completion.
