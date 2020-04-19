extends Sprite


var stats = PlayerStats

onready var healthAchievementLabel = $CenterContainer/VBoxContainer/HealthAchievementLabel
onready var oneVirusAchievementLabel = $CenterContainer/VBoxContainer/OneVirusAchievementLabel
onready var oneWormAchievementLabel = $CenterContainer/VBoxContainer/OneWormAchievementLabel
onready var oneSpamEmailAchievementLabel = $CenterContainer/VBoxContainer/OneSpamEmailAchievementLabel
onready var oneMalwareAchievementLabel = $CenterContainer/VBoxContainer/OneMalwareAchievementLabel
onready var oneHackerAchievementLabel = $CenterContainer/VBoxContainer/OneHackerAchievementLabel
onready var oneCryptoMinerAchievementLabel = $CenterContainer/VBoxContainer/OneCryptoMinerAchievementLabel

onready var oneTwoEightVirusAchievementLabel = $CenterContainer/VBoxContainer/OneTwoEightVirusAchievementLabel
onready var oneTwoEightWormAchievementLabel = $CenterContainer/VBoxContainer/OneTwoEightWormAchievementLabel
onready var oneTwoEightSpamEmailAchievementLabel = $CenterContainer/VBoxContainer/OneTwoEightSpamEmailAchievementLabel
onready var oneTwoEightMalwareAchievementLabel = $CenterContainer/VBoxContainer/OneTwoEightMalwareAchievementLabel
onready var oneTwoEightHackerAchievementLabel = $CenterContainer/VBoxContainer/OneTwoEightHackerAchievementLabel
onready var oneTwoEightCryptoMinerAchievementLabel = $CenterContainer/VBoxContainer/OneTwoEightCryptoMinerAchievementLabel

onready var hackerAchievementLabel = $CenterContainer/VBoxContainer/HackerAchievementLabel


func _ready():
	if stats.save_data.achievements.health_over_9000 == 1:
		healthAchievementLabel.text = "IT'S OVER NINE THOUSAND!!1!"
	if stats.save_data.achievements.one_virus_cleaned == 1:
		oneVirusAchievementLabel.text = "One Virus Killed"
	if stats.save_data.achievements.one_worms_cleaned == 1:
		oneWormAchievementLabel.text = "One Worm Killed"
	if stats.save_data.achievements.one_spam_stopped == 1:
		oneSpamEmailAchievementLabel.text = "One Spam Email Filtered"
	if stats.save_data.achievements.one_malware_removed == 1:
		oneMalwareAchievementLabel.text = "One Malware Removed"
	if stats.save_data.achievements.one_hackers_stopped == 1:
		oneHackerAchievementLabel.text = "One Hacker Thwarted"
	if stats.save_data.achievements.one_crypto_miners_repurposed == 1:
		oneCryptoMinerAchievementLabel.text = "One Crypto Miner Repurposed"
	
	if stats.save_data.achievements.onetwoeight_virus_cleaned == 1:
		oneTwoEightVirusAchievementLabel.text = "128 Viruses Killed"
	if stats.save_data.achievements.onetwoeight_worms_cleaned == 1:
		oneTwoEightWormAchievementLabel.text = "128 Worms Killed"
	if stats.save_data.achievements.onetwoeight_spam_stopped == 1:
		oneTwoEightSpamEmailAchievementLabel.text = "128 Spam Emails Filtered"
	if stats.save_data.achievements.onetwoeight_malware_removed == 1:
		oneTwoEightMalwareAchievementLabel.text = "128 Malwares Removed"
	if stats.save_data.achievements.onetwoeight_hackers_stopped == 1:
		oneTwoEightHackerAchievementLabel.text = "128 Hackers Thwarted"
	if stats.save_data.achievements.onetwoeight_crypto_miners_repurposed == 1:
		oneTwoEightCryptoMinerAchievementLabel.text = "128 Crypto Miners Repurposed"
	
	if stats.save_data.achievements.hacker == 1:
		hackerAchievementLabel.text = "You hacker, you!"


func _on_CloseButton_pressed():
	queue_free()
