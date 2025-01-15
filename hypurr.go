package hypurr_grpc

import (
	"strconv"
)

func (x *HyperliquidLaunchTradeRequest) TelegramID() int64 {
	userIdStr, ok := x.AuthData["id"]
	if !ok {
		return 0
	}
	userId, err := strconv.ParseInt(userIdStr, 10, 64)
	if err != nil {
		return 0
	}
	return userId
}

// Rate limit weights
func (x *HyperliquidDeployAuctionRequest) Weight() int {
	return 1
}

func (x *HyperliquidTokensRequest) Weight() int {
	return 1
}

func (x *HyperliquidTokenHoldersRequest) Weight() int {
	return 5
}

func (x *HyperliquidTokenMessagesRequest) Weight() int {
	return 2
}

func (x *HyperliquidSpotPairRequest) Weight() int {
	return 1
}

func (x *HyperliquidSpotPairsRequest) Weight() int {
	return 2
}

func (x *HyperliquidPerpPairsRequest) Weight() int {
	return 2
}

func (x *HyperliquidWalletRequest) Weight() int {
	return 2
}

func (x *HyperliquidWalletPerformanceRequest) Weight() int {
	return 10
}

func (x *HyperliquidLaunchRequest) Weight() int {
	return 1
}

func (x *HyperliquidLaunchesRequest) Weight() int {
	return 2
}

func (x *HyperliquidLaunchStreamRequest) Weight() int {
	return 2
}

func (x *HyperliquidLaunchFillsRequest) Weight() int {
	return 2
}

func (x *LatestHyperliquidLaunchFillsRequest) Weight() int {
	return 2
}

func (x *HyperliquidLaunchCandlesRequest) Weight() int {
	return 2
}

func (x *HyperliquidLaunchMessagesRequest) Weight() int {
	return 2
}

func (x *HyperliquidLaunchHoldersRequest) Weight() int {
	return 5
}

func (x *HypurrFunCabalsRequest) Weight() int {
	return 2
}
