extends CanvasLayer
	
func update_coin_hud():
	$Coins/CoinsCollected.text = str(Global.coins_collected) + " / " + str(Global.total_coins)
	
func display_key():
	$Key.visible = true


