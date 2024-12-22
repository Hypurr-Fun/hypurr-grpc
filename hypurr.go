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
