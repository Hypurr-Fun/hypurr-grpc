package hypurrgrpc_test

import (
	"testing"

	iospb "gitlab.com/hypurr/hypurr-grpc/go/hypurr/ios"
	"google.golang.org/protobuf/proto"
)

func TestTraderWinRatePresence(t *testing.T) {
	for _, tc := range []struct {
		name  string
		value *float64
	}{
		{name: "absent"},
		{name: "zero", value: proto.Float64(0)},
		{name: "nonzero", value: proto.Float64(54.8)},
	} {
		t.Run(tc.name, func(t *testing.T) {
			want := &iospb.Trader{WinRatePercent: tc.value}
			data, err := proto.Marshal(want)
			if err != nil {
				t.Fatal(err)
			}

			var got iospb.Trader
			if err := proto.Unmarshal(data, &got); err != nil {
				t.Fatal(err)
			}
			if !proto.Equal(&got, want) {
				t.Errorf("Trader round trip(%s) = %v, want %v", tc.name, &got, want)
			}
		})
	}
}
