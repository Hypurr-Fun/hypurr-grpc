# iOS User Stream Position Details Plan

Specification: [[ios-user-stream-position-details-spec]]

Status: Awaiting approval

## Approval

- [ ] Approve the exact contract from the GitLab note.
- [ ] Approve the additive `UserStream` scope.
- [ ] Approve generated binding changes.
- [ ] Approve this plan.

## Pseudocode Gate

- [ ] Show the proto pseudocode in chat.
- [ ] Include a line estimate for each section and the total.
- [ ] Stop and wait for sign-off before the proto edit.

## Implementation

- [ ] Extend `SpotHolding` in `hypurr/ios.proto`.
- [ ] Extend `OpenPerpPosition` in `hypurr/ios.proto`.
- [ ] Add the two detail messages, margin enum, and auto-close message.
- [ ] Stop and wait for review of `hypurr/ios.proto`.
- [ ] Regenerate the Go binding and stop for review.
- [ ] Regenerate the TypeScript binding and stop for review.
- [ ] Regenerate the Python binding and stop for review.

## Verification

- [ ] Compile `hypurr/ios.proto` with each targeted generator.
- [ ] Run `go test ./...`.
- [ ] Run `go build ./...`.
- [ ] Run `go vet ./...`.
- [ ] Import the generated Python modules.
- [ ] Run the available TypeScript check if one exists.
- [ ] Run `git diff --check`.
- [ ] Quote the command output before completion.
