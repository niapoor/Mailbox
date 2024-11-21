extends Sprite2D

# Preload the email images
var scamlight1 = preload("res://Assets/Emails/BackpackWinnerLight.png")
var scamdark1 = preload("res://Assets/Emails/BackpackWinnerDark.png")
var annotatedscamlight1 = preload("res://Assets/Emails/Annotated/AnnotatedBackpackWinnerLight.png")
var annotatedscamdark1 = preload("res://Assets/Emails/Annotated/AnnotatedBackpackWinnerDark.png")

var scamlight2 = preload("res://Assets/Emails/Confirmation_729Light.png")
var scamdark2 = preload("res://Assets/Emails/Confirmation_729Dark.png")
var annotatedscamlight2 = preload("res://Assets/Emails/Annotated/AnnotatedConfirmation_729Light.png")
var annotatedscamdark2 = preload("res://Assets/Emails/Annotated/AnnotatedConfirmation_729Dark.png")

var scamlight3 = preload("res://Assets/Emails/VivintLight.png")
var scamdark3 = preload("res://Assets/Emails/VivintDark.png")
var annotatedscamlight3 = preload("res://Assets/Emails/Annotated/AnnotatedVivintLight.png")
var annotatedscamdark3 = preload("res://Assets/Emails/Annotated/AnnotatedVivintDark.png")

var scamlight4 = preload("res://Assets/Emails/NetflixLight.png")
var scamdark4 = preload("res://Assets/Emails/NetflixDark.png")
var annotatedscamlight4 = preload("res://Assets/Emails/Annotated/AnnotatedNetflixLight.png")
var annotatedscamdark4 = preload("res://Assets/Emails/Annotated/AnnotatedNetflixDark.png")

var scamlight5 = preload("res://Assets/Emails/ConfirmUnsubscribeLight.png")
var scamdark5 = preload("res://Assets/Emails/ConfirmUnsubscribeDark.png")
var annotatedscamlight5 = preload("res://Assets/Emails/Annotated/AnnotatedConfirmUnsubscribeLight.png")
var annotatedscamdark5 = preload("res://Assets/Emails/Annotated/AnnotatedConfirmUnsubscribeDark.png")

var scamlight6 = preload("res://Assets/Emails/YetiWinnerLight.png")
var scamdark6 = preload("res://Assets/Emails/YetiWinnerDark.png")
var annotatedscamlight6 = preload("res://Assets/Emails/Annotated/AnnotatedYetiWinnerLight.png")
var annotatedscamdark6 = preload("res://Assets/Emails/Annotated/AnnotatedYetiWinnerDark.png")

var scamlight7 = preload("res://Assets/Emails/CostcoLight.png")
var scamdark7 = preload("res://Assets/Emails/CostcoDark.png")
var annotatedscamlight7 = preload("res://Assets/Emails/Annotated/AnnotatedCostcoLight.png")
var annotatedscamdark7 = preload("res://Assets/Emails/Annotated/AnnotatedCostcoDark.png")

var scamlight8 = preload("res://Assets/Emails/ParamountPlusLight.png")
var scamdark8 = preload("res://Assets/Emails/ParamountPlusDark.png")
var annotatedscamlight8 = preload("res://Assets/Emails/Annotated/AnnotatedParamountPlusLight.png")
var annotatedscamdark8 = preload("res://Assets/Emails/Annotated/AnnotatedParamountPlusDark.png")

var scamlight9 = preload("res://Assets/Emails/SiriusXMLight.png")
var scamdark9 = preload("res://Assets/Emails/SiriusXMDark.png")
var annotatedscamlight9 = preload("res://Assets/Emails/Annotated/AnnotatedSiriusXMLight.png")
var annotatedscamdark9 = preload("res://Assets/Emails/Annotated/AnnotatedSiriusXMDark.png")

var scamlight10 = preload("res://Assets/Emails/Package1Light.png")
var scamdark10 = preload("res://Assets/Emails/Package1Dark.png")
var annotatedscamlight10 = preload("res://Assets/Emails/Annotated/AnnotatedPackage1Light.png")
var annotatedscamdark10 = preload("res://Assets/Emails/Annotated/AnnotatedPackage1Dark.png")

var legitlight11 = preload("res://Assets/Emails/AppleFitnessLight.png")
var legitdark11 = preload("res://Assets/Emails/AppleFitnessDark.png")
var annotatedlegitlight11 = preload("res://Assets/Emails/Annotated/AnnotatedAppleFitnessLight.png")
var annotatedlegitdark11 = preload("res://Assets/Emails/Annotated/AnnotatedAppleFitnessDark.png")

var legitlight12 = preload("res://Assets/Emails/PaneraFeedbackLight.png")
var legitdark12 = preload("res://Assets/Emails/PaneraFeedbackDark.png")
var annotatedlegitlight12 = preload("res://Assets/Emails/Annotated/AnnotatedPaneraFeedbackLight.png")
var annotatedlegitdark12 = preload("res://Assets/Emails/Annotated/AnnotatedPaneraFeedbackDark.png")

var legitlight13 = preload("res://Assets/Emails/LegoFlowersLight.png")
var legitdark13 = preload("res://Assets/Emails/LegoFlowersDark.png")
var annotatedlegitlight13 = preload("res://Assets/Emails/Annotated/AnnotatedLegoFlowersLight.png")
var annotatedlegitdark13 = preload("res://Assets/Emails/Annotated/AnnotatedLegoFlowersDark.png")

var legitlight14 = preload("res://Assets/Emails/GoogleAddressesLight.png")
var legitdark14 = preload("res://Assets/Emails/GoogleAddressesDark.png")
var annotatedlegitlight14 = preload("res://Assets/Emails/Annotated/AnnotatedGoogleAddressesLight.png")
var annotatedlegitdark14 = preload("res://Assets/Emails/Annotated/AnnotatedGoogleAddressesDark.png")

var legitlight15 = preload("res://Assets/Emails/AllstateFeedbackLight.png")
var legitdark15 = preload("res://Assets/Emails/AllstateFeedbackDark.png")
var annotatedlegitlight15 = preload("res://Assets/Emails/Annotated/AnnotatedAllstateFeedbackLight.png")
var annotatedlegitdark15 = preload("res://Assets/Emails/Annotated/AnnotatedAllstateFeedbackDark.png")

var legitlight16 = preload("res://Assets/Emails/AetnaClaimLight.png")
var legitdark16 = preload("res://Assets/Emails/AetnaClaimDark.png")
var annotatedlegitlight16 = preload("res://Assets/Emails/Annotated/AnnotatedAetnaClaimLight.png")
var annotatedlegitdark16 = preload("res://Assets/Emails/Annotated/AnnotatedAetnaClaimDark.png")

var legitlight17 = preload("res://Assets/Emails/AllyAdvertLight.png")
var legitdark17 = preload("res://Assets/Emails/AllyAdvertDark.png")
var annotatedlegitlight17 = preload("res://Assets/Emails/Annotated/AnnotatedAllyAdvertLight.png")
var annotatedlegitdark17 = preload("res://Assets/Emails/Annotated/AnnotatedAllyAdvertDark.png")

var legitlight18 = preload("res://Assets/Emails/LyftReceiptLight.png")
var legitdark18 = preload("res://Assets/Emails/LyftReceiptDark.png")
var annotatedlegitlight18 = preload("res://Assets/Emails/Annotated/AnnotatedLyftReceiptLight.png")
var annotatedlegitdark18 = preload("res://Assets/Emails/Annotated/AnnotatedLyftReceiptDark.png")

var legitlight19 = preload("res://Assets/Emails/DiscoverAdvertLight.png")
var legitdark19 = preload("res://Assets/Emails/DiscoverAdvertDark.png")
var annotatedlegitlight19 = preload("res://Assets/Emails/Annotated/AnnotatedDiscoverAdvertLight.png")
var annotatedlegitdark19 = preload("res://Assets/Emails/Annotated/AnnotatedDiscoverAdvertDark.png")

var legitlight20 = preload("res://Assets/Emails/GoogleSignInLight.png")
var legitdark20 = preload("res://Assets/Emails/GoogleSignInDark.png")
var annotatedlegitlight20 = preload("res://Assets/Emails/Annotated/AnnotatedGoogleSignInLight.png")
var annotatedlegitdark20 = preload("res://Assets/Emails/Annotated/AnnotatedGoogleSignInDark.png")

var scamlight21 = preload("res://Assets/Emails/Confirmation_0826108Light.png")
var scamdark21 = preload("res://Assets/Emails/Confirmation_0826108Dark.png")
var annotatedscamlight21 = preload("res://Assets/Emails/Annotated/AnnotatedConfirmation_0826108Light.png")
var annotatedscamdark21 = preload("res://Assets/Emails/Annotated/AnnotatedConfirmation_0826108Dark.png")

var scamlight22 = preload("res://Assets/Emails/25DepositLight.png")
var scamdark22 = preload("res://Assets/Emails/25DepositDark.png")
var annotatedscamlight22 = preload("res://Assets/Emails/Annotated/Annotated25DepositLight.png")
var annotatedscamdark22 = preload("res://Assets/Emails/Annotated/Annotated25DepositDark.png")

var scamlight23 = preload("res://Assets/Emails/AnswerWiniPadLight.png")
var scamdark23 = preload("res://Assets/Emails/AnswerWiniPadDark.png")
var annotatedscamlight23 = preload("res://Assets/Emails/Annotated/AnnotatedAnswerWiniPadLight.png")
var annotatedscamdark23 = preload("res://Assets/Emails/Annotated/AnnotatedAnswerWiniPadDark.png")

var scamlight24 = preload("res://Assets/Emails/AmericanWildCasinoLight.png")
var scamdark24 = preload("res://Assets/Emails/AmericanWildCasinoDark.png")
var annotatedscamlight24 = preload("res://Assets/Emails/Annotated/AnnotatedAmericanWildCasinoLight.png")
var annotatedscamdark24 = preload("res://Assets/Emails/Annotated/AnnotatedAmericanWildCasinoDark.png")

var scamlight25 = preload("res://Assets/Emails/HighCountryCasinoLight.png")
var scamdark25 = preload("res://Assets/Emails/HighCountryCasinoDark.png")
var annotatedscamlight25 = preload("res://Assets/Emails/Annotated/AnnotatedHighCountryCasinoLight.png")
var annotatedscamdark25 = preload("res://Assets/Emails/Annotated/AnnotatedHighCountryCasinoDark.png")

var scamlight26 = preload("res://Assets/Emails/EntryNonTransferableLight.png")
var scamdark26 = preload("res://Assets/Emails/EntryNonTransferableDark.png")
var annotatedscamlight26 = preload("res://Assets/Emails/Annotated/AnnotatedEntryNonTransferableLight.png")
var annotatedscamdark26 = preload("res://Assets/Emails/Annotated/AnnotatedEntryNonTransferableDark.png")

var scamlight27 = preload("res://Assets/Emails/5500PayoutLight.png")
var scamdark27 = preload("res://Assets/Emails/5500PayoutDark.png")
var annotatedscamlight27 = preload("res://Assets/Emails/Annotated/Annotated5500PayoutLight.png")
var annotatedscamdark27 = preload("res://Assets/Emails/Annotated/Annotated5500PayoutDark.png")

var scamlight28 = preload("res://Assets/Emails/OptimismCollectiveLight.png")
var scamdark28 = preload("res://Assets/Emails/OptimismCollectiveDark.png")
var annotatedscamlight28 = preload("res://Assets/Emails/Annotated/AnnotatedOptimismCollectiveLight.png")
var annotatedscamdark28 = preload("res://Assets/Emails/Annotated/AnnotatedOptimismCollectiveDark.png")

var scamlight29 = preload("res://Assets/Emails/QuickQuestionLight.png")
var scamdark29 = preload("res://Assets/Emails/QuickQuestionDark.png")
var annotatedscamlight29 = preload("res://Assets/Emails/Annotated/AnnotatedQuickQuestionLight.png")
var annotatedscamdark29 = preload("res://Assets/Emails/Annotated/AnnotatedQuickQuestionDark.png")

var scamlight30 = preload("res://Assets/Emails/SelectedLight.png")
var scamdark30 = preload("res://Assets/Emails/SelectedDark.png")
var annotatedscamlight30 = preload("res://Assets/Emails/Annotated/AnnotatedSelectedLight.png")
var annotatedscamdark30 = preload("res://Assets/Emails/Annotated/AnnotatedSelectedDark.png")

var legitlight31 = preload("res://Assets/Emails/AppAccessLight.png")
var legitdark31 = preload("res://Assets/Emails/AppAccessDark.png")
var annotatedlegitlight31 = preload("res://Assets/Emails/Annotated/AnnotatedAppAccessLight.png")
var annotatedlegitdark31 = preload("res://Assets/Emails/Annotated/AnnotatedAppAccessDark.png")

var legitlight32 = preload("res://Assets/Emails/LLBeanAdLight.png")
var legitdark32 = preload("res://Assets/Emails/LLBeanAdDark.png")
var annotatedlegitlight32 = preload("res://Assets/Emails/Annotated/AnnotatedLLBeanAdLight.png")
var annotatedlegitdark32 = preload("res://Assets/Emails/Annotated/AnnotatedLLBeanAdDark.png")

var legitlight33 = preload("res://Assets/Emails/PayPalPrivacyLight.png")
var legitdark33 = preload("res://Assets/Emails/PayPalPrivacyDark.png")
var annotatedlegitlight33 = preload("res://Assets/Emails/Annotated/AnnotatedPayPalPrivacyLight.png")
var annotatedlegitdark33 = preload("res://Assets/Emails/Annotated/AnnotatedPayPalPrivacyDark.png")

var legitlight34 = preload("res://Assets/Emails/VenmoChangesLight.png")
var legitdark34 = preload("res://Assets/Emails/VenmoChangesDark.png")
var annotatedlegitlight34 = preload("res://Assets/Emails/Annotated/AnnotatedVenmoChangesLight.png")
var annotatedlegitdark34 = preload("res://Assets/Emails/Annotated/AnnotatedVenmoChangesDark.png")

var legitlight35 = preload("res://Assets/Emails/AmericanAirlinesAdLight.png")
var legitdark35 = preload("res://Assets/Emails/AmericanAirlinesAdDark.png")
var annotatedlegitlight35 = preload("res://Assets/Emails/Annotated/AnnotatedAmericanAirlinesAdLight.png")
var annotatedlegitdark35 = preload("res://Assets/Emails/Annotated/AnnotatedAmericanAirlinesAdDark.png")

var inbox_email_dict = {}
var archived_email_dict = {}
var reported_email_dict = {}
var all_emails_dict = {}

var selected_numbers = []
var selected_numbers_static = []
var current_email_button_location = 1
var current_email = 1

var current_archived_email = 1
var current_reported_email = 1

var user_answers = []

var archived_numbers = []
var current_archived_email_button_location = 1

var reported_numbers = []
var current_reported_email_button_location = 1

var number_pool_examples = []
var legit_number_pool_examples = []
var scam_number_pool_examples = []

# 0 = both, 1 = legit, 2 = scam
var example_email_type = 2
var example_annotated = true
var current_example_email_index = 0

# Reference to the landing page node (adjust path as needed)
@onready var landing_page_instance = get_node_or_null("../LandingPage")  # Assuming LandingPage is a sibling node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_tasks_in_ready()
	_example_scam_pool_randomize()
	_example_legit_pool_randomize()
	_example_number_pool_randomize()

func _tasks_in_ready():
	inbox_email_dict = _populate_dictionary(inbox_email_dict)
	all_emails_dict = inbox_email_dict.duplicate()
	_select_emails(inbox_email_dict)
	selected_numbers_static = selected_numbers.duplicate()

func get_number_pool_examples() -> Array:
	return number_pool_examples
	
func legit_get_number_pool_examples() -> Array:
	return legit_number_pool_examples
	
func scam_get_number_pool_examples() -> Array:
	return scam_number_pool_examples

func get_example_email_type() -> int:
	return example_email_type
	
func set_example_email_type(value: int) -> void:
	example_email_type = value

func get_example_annotated() -> bool:
	return example_annotated

func set_example_annotated(value: bool) -> void:
	example_annotated = value

func get_email_dict() -> Dictionary:
	return inbox_email_dict
	
func set_email_dict(value: Dictionary) -> void:
	inbox_email_dict = value

func get_archived_email_dict() -> Dictionary:
	return archived_email_dict

func set_archived_email_dict(value: Dictionary) -> void:
	archived_email_dict = value
	
func get_reported_email_dict() -> Dictionary:
	return reported_email_dict

func set_reported_email_dict(value: Dictionary) -> void:
	reported_email_dict = value

func get_all_emails_dict() -> Dictionary:
	return all_emails_dict

func get_current_email() -> int:
	return current_email

func set_current_email(value: int) -> void:
	current_email = value
	
func get_current_archived_email() -> int:
	return current_archived_email

func set_current_archived_email(value: int) -> void:
	current_archived_email = value
	
func get_current_reported_email() -> int:
	return current_reported_email

func set_current_reported_email(value: int) -> void:
	current_reported_email = value

func get_selected_numbers() -> Array:
	return selected_numbers

func get_archived_numbers() -> Array:
	return archived_numbers

func get_reported_numbers() -> Array:
	return reported_numbers
	
func get_selected_numbers_static() -> Array:
	return selected_numbers_static

func get_user_answers() -> Array:
	return user_answers

func set_selected_numbers(value: Array) -> void:
	selected_numbers = value

func set_archived_numbers(value: Array) -> void:
	archived_numbers = value

func set_reported_numbers(value: Array) -> void:
	reported_numbers = value

func set_user_answers(value: Array) -> void:
	user_answers = value

func get_current_email_button_location() -> int:
	return current_email_button_location

func get_archived_email_button_location() -> int:
	return current_archived_email_button_location
	
func get_reported_email_button_location() -> int:
	return current_reported_email_button_location

func set_current_email_button_location(value: int) -> void:
	current_email_button_location = value

func set_archived_email_button_location(value: int) -> void:
	current_archived_email_button_location = value

func set_reported_email_button_location(value: int) -> void:
	current_reported_email_button_location = value

func _select_emails(inbox_email_dict):
	randomize()
	
	var number_pool = []
	
	# Populate the pool with numbers
	for i in range(1, 36):
		number_pool.append(i)

	# Randomly select 5 unique numbers
	for i in range(5):
		var index = randi() % number_pool.size()
		selected_numbers.append(number_pool[index])
		number_pool.remove_at(index)
	
	current_email = selected_numbers[0]
	
	_draw_email_image(selected_numbers[0], inbox_email_dict, 0, 1)
	

func _draw_email_image(email_number_to_draw, email_dict, current_position, current_theme):
	current_email_button_location = current_position
	# Drawing in the current image based on the theme (light / dark)
	_draw_email_based_on_theme(email_dict[email_number_to_draw]["light_image"], email_dict[email_number_to_draw]["dark_image"], current_theme)
	# Scale by half to properly fit the bottom right of the screen
	scale = Vector2(0.5, 0.5)
	# Set the position to x: 805, y: 404 (to fit in the bottom right of the screen)
	position = Vector2(805, 404)

func _draw_annotated_image(email_number_to_draw, email_dict, current_position, current_theme):
	current_email_button_location = current_position
	# Drawing in the current image based on the theme (light / dark)
	_draw_email_based_on_theme(email_dict[email_number_to_draw]["annotated_light"], email_dict[email_number_to_draw]["annotated_dark"], current_theme)
	# Scale by half to properly fit the bottom right of the screen
	scale = Vector2(0.5, 0.5)
	# Set the position to x: 805, y: 404 (to fit in the bottom right of the screen)
	position = Vector2(805, 404)


func _draw_email_based_on_theme(light_choice, dark_choice, current_theme):
	if current_theme == 1:
		texture = light_choice
	elif current_theme == 2:
		texture = dark_choice

func _remove_email_drawing():
	texture = null

func _populate_dictionary(inbox_email_dict):
	# 1-10 ARE SCAM
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 1, "Claim Your Prize: Survey and Win a Yeti Crossroads Backpack", "This email is a scam. Some ways you can tell include:\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• Asking for your information through a survey.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight1, scamdark1, annotatedscamlight1, annotatedscamdark1)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 2, "CONFIRMATION-729", "This email is a scam. Some ways you can tell include:\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• No context for why you are being emailed.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight2, scamdark2, annotatedscamlight2, annotatedscamdark2)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 3, "Secure Your H0me With Viivint mVi", "This email is a scam. Some ways you can tell include:\n[indent]• The subject of the email has errors, such as a zero in place of the letter \"o\".[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]\n[indent]• This email is unsolicited.[/indent]", false, scamlight3, scamdark3, annotatedscamlight3, annotatedscamdark3)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 4, "Your Account Will be Blocked, Unable To Validate Your Billing Information!!", "This email is a scam. Some ways you can tell include:\n[indent]• The subject of the email is different than the email content.[/indent]\n[indent]• An offer that is too good to be true.[/indent]\n[indent]• An urgent subject line that tries to get you to act quickly.[/indent]\n[indent]• A button that hides the link it wants you to visit.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight4, scamdark4, annotatedscamlight4, annotatedscamdark4)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 5, "Please confirm your Unsubscribe", "This email is a scam. Some ways you can tell include:\n[indent]• There are grammar errors throughout this email.[/indent]\n[indent]• No context for why you are being emailed.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight5, scamdark5, annotatedscamlight5, annotatedscamdark5)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 6, "Congrats!! You're the winner of YETI Outdoors Essential Box: #83485-6359", "This email is a scam. Some ways you can tell include:\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]\n[indent]• This email is unsolicited.[/indent]", false, scamlight6, scamdark6, annotatedscamlight6, annotatedscamdark6)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 7, "Renew Today and Get a FREE Year of Costco Membership!", "This email is a scam. Some ways you can tell include:\n[indent]• Asks for personal payment information.[/indent]\n[indent]• A deal that is too good to be true.[/indent]\n[indent]• Missing spaces between words and sentences and other grammar errors.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight7, scamdark7, annotatedscamlight7, annotatedscamdark7)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 8, "Your Paramount+ Membership has Expired", "This email is a scam. Some ways you can tell include:\n[indent]• Contradictory email content, welcoming you while also saying your existing account has expired.[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight8, scamdark8, annotatedscamlight8, annotatedscamdark8)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 9, "Your Account Sirius XM Will Be Removed Today", "This email is a scam. Some ways you can tell include:\n[indent]• An urgent subject line that tries to get you to act quickly.[/indent]\n[indent]• Wants financial information to \"renew your subscription\".[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]", false, scamlight9, scamdark9, annotatedscamlight9, annotatedscamdark9)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 10, "you have (1) package waiting for delivery", "This email is a scam. Some ways you can tell include:\n[indent]• Asking for personal information (address).[/indent]\n[indent]• The sender of the email looks suspicious.[/indent]\n[indent]• The Tracking ID is not associated with a real package.[/indent]", false, scamlight10, scamdark10, annotatedscamlight10, annotatedscamdark10)

	
	# 11-20 ARE LEGIT
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 11, "Start your free 3-month trial.", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• An offer that is not too good to be true.[/indent]", true, legitlight11, legitdark11, annotatedlegitlight11, annotatedlegitdark11)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 12, "Please share your feedback", "This email is legitimate. Some ways you can tell include:\n[indent]• Survey asks for Panera bread experience, not personal information.[/indent]", true, legitlight12, legitdark12, annotatedlegitlight12, annotatedlegitdark12)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 13, "Flower Bouquet is now back in stock", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is notifying you of a product that is in stock.[/indent]\n[indent]• The email is not too good to be true or asking for your personal information.[/indent]", true, legitlight13, legitdark13, annotatedlegitlight13, annotatedlegitdark13)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 14, "Google: Manage your saved addresses in your Google Account", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is notifying you of a Google account address feature.[/indent]\n[indent]• The email is not too good to be true or asking for your personal information.[/indent]", true, legitlight14, legitdark14, annotatedlegitlight14, annotatedlegitdark14)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 15, "Got a minute to share your feedback?", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is asking for a Google review for their services.[/indent]\n[indent]• The email is not too good to be true or asking for your personal information.[/indent]", true, legitlight15, legitdark15, annotatedlegitlight15, annotatedlegitdark15)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 16, "Here's your most recent Aetna claim", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is notifying you of a healthcare insurance claim.[/indent]\n[indent]• The email is not too good to be true or asking for your personal information.[/indent]", true, legitlight16, legitdark16, annotatedlegitlight16, annotatedlegitdark16)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 17, "Put your savings on autopilot", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is an advertisement for a banking service.[/indent]\n[indent]• The email is not too good to be true or asking for your personal information.[/indent]", true, legitlight17, legitdark17, annotatedlegitlight17, annotatedlegitdark17)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 18, "Receipt for your cancelled ride", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is notifying you of a charge from Lyft.[/indent]\n[indent]• If you are ever concerned about a charge, be sure to follow-up with the appropriate company.[/indent]", true, legitlight18, legitdark18, annotatedlegitlight18, annotatedlegitdark18)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 19, "Final activation reminder: get 5% cash back", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is an advertisement for a credit card.[/indent]\n[indent]• The email is not too good to be true or asking for your personal information.[/indent]", true, legitlight19, legitdark19, annotatedlegitlight19, annotatedlegitdark19)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 20, "Security Alert", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• The email is notifying you of a new sign-in.[/indent]\n[indent]• If you are ever concerned about a sign-in, be sure to check that account’s activity.[/indent]", true, legitlight20, legitdark20, annotatedlegitlight20, annotatedlegitdark20)

	
	# 21-30 ARE SCAM
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 21, "Confirmation 0826108", "This email is a scam. Some ways you can tell include:\n[indent]• A lack of context for why the email was sent.[/indent]\n[indent]• Misspellings at the top of the email.[/indent]\n[indent]• Asking you to click a link without an explanation.[/indent]", false, scamlight21, scamdark21, annotatedscamlight21, annotatedscamdark21)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 22, "$ You received a direct deposited $ 25 $ No Deposit Needed!", "This email is a scam. Some ways you can tell include:\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• A lack of context for why the email was sent.[/indent]\n[indent]• The website and sender's website do not match.[/indent]\n[indent]• Asking for your personal information.[/indent]", false, scamlight22, scamdark22, annotatedscamlight22, annotatedscamdark22)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 23, "You got (1) package pending for delivery.", "This email is a scam. Some ways you can tell include:\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• A lack of context for why the email was sent.[/indent]\n[indent]• The email's subject and content do not match.[/indent]\n[indent]• Asking for your personal information.[/indent]\n[indent]• Grammatical error in the subject line.[/indent]", false, scamlight23, scamdark23, annotatedscamlight23, annotatedscamdark23)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 24, "Please check Your Account", "This email is a scam. Some ways you can tell include:\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• Fake \"Google Trusted Sender\" banner.[/indent]\n[indent]• A lack of context for why the email was sent.[/indent]\n[indent]• The sender is unprofessional (a bunch of random letters).[/indent]\n[indent]• Randomly placed emojis.[/indent]", false, scamlight24, scamdark24, annotatedscamlight24, annotatedscamdark24)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 25, "I have a Royal secret for you…", "This email is a scam. Some ways you can tell include:\n[indent]• Trying to make you interested and gain your trust by telling you a “Royal secret”.[/indent]\n[indent]• A prize that is too good to be true.[/indent]\n[indent]• The email sender is unprofessional.[/indent]\n[indent]• Grammatical errors throughout email.[/indent]", false, scamlight25, scamdark25, annotatedscamlight25, annotatedscamdark25)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 26, "You won!!! Claim your prize", "This email is a scam. Some ways you can tell include:\n[indent]• Tries to get you to act urgently (before the end of today).[/indent]\n[indent]• An offer that is too good to be true.[/indent]\n[indent]• The sender is unprofessional (a bunch of random letters and numbers).[/indent]\n[indent]• Odd additions (a random empty rectangle).[/indent]", false, scamlight26, scamdark26, annotatedscamlight26, annotatedscamdark26)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 27, "You received a direct deposited of $ 5,500.USD", "This email is a scam. Some ways you can tell include:\n[indent]• Has a prize that is too good to be true.[/indent]\n[indent]• Has a link that will likely ask for your personal information to “verify” your account.[/indent]\n[indent]• The sender of this email is unfamiliar.[/indent]", false, scamlight27, scamdark27, annotatedscamlight27, annotatedscamdark27)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 28, "Optimism is announcing OP #5", "This email is a scam. Some ways you can tell include:\n[indent]• Gives you an offer that seems too good to be true.[/indent]\n[indent]• The email address of the sender does not appear to be related to the “Optimism Collective”.[/indent]\n[indent]• Makes their product seem exclusive to make you more interested in participating.[/indent]", false, scamlight28, scamdark28, annotatedscamlight28, annotatedscamdark28)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 29, "time for a quick question?", "This email is a scam. Some ways you can tell include:\n[indent]• Gives you an offer that seems too good to be true.[/indent]\n[indent]• The email sender’s name is different than the person’s name at the bottom of this email.[/indent]\n[indent]• The sender’s website is also not related to the company’s name.[/indent]", false, scamlight29, scamdark29, annotatedscamlight29, annotatedscamdark29)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 30, "This Week Only: Prepare for Anything!", "This email is a scam. Some ways you can tell include:\n[indent]• The sender is unprofessional (a bunch of random letters).[/indent]\n[indent]• Urges you to act quickly in the subject line.[/indent]\n[indent]• Random symbols in the top left of the email for seemingly no reason.[/indent]\n[indent]• A prize that is too good to be true and meant to make you feel special.[/indent]\n[indent]• No explanation behind why you were selected or what you were selected for.[/indent]", false, scamlight30, scamdark30, annotatedscamlight30, annotatedscamdark30)


	# 31-40 ARE LEGIT
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 31, "New app(s) connected to your Microsoft account", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• Informing you of a connected app in a non-urgent way.[/indent]", true, legitlight31, legitdark31, annotatedlegitlight31, annotatedlegitdark31)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 32, "Premium Flannel PJs in Vibrant NEW Tartans", "This email is legitimate. Some ways you can tell include:\n[indent]• A professional looking sender that makes sense in context.[/indent]\n[indent]• Informing you of a connected app in a non-urgent way.[/indent]", true, legitlight32, legitdark32, annotatedlegitlight32, annotatedlegitdark32)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 33, "Upcoming changes to our Legal Agreements", "This email is legitimate. Some ways you can tell include:\n[indent]• The sender seems professional and makes sense in the context of the email.[/indent]\n[indent]• This email is a notification that does not require any action from you.[/indent]", true, legitlight33, legitdark33, annotatedlegitlight33, annotatedlegitdark33)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 34, "Upcoming changes to Venmo", "This email is legitimate. Some ways you can tell include:\n[indent]• The sender seems professional and makes sense in the context of the email.[/indent]\n[indent]• This email is a notification that does not require any action from you.[/indent]\n[indent]• While this email does talk about money, it does not ask for your personal information.[/indent]", true, legitlight34, legitdark34, annotatedlegitlight34, annotatedlegitdark34)
	inbox_email_dict = _add_dict_email_entry(inbox_email_dict, 35, "Update: Earning miles on flights", "This email is legitimate. Some ways you can tell include:\n[indent]• The sender uses aa.com, the official website for American Airlines.[/indent]\n[indent]• The offer in this email is not too good to be true.[/indent]", true, legitlight35, legitdark35, annotatedlegitlight35, annotatedlegitdark35)

	
	
	#inbox_email_dict = _add_dict_email_entry(inbox_email_dict, number, subject, explanation, false, scamlight, scamdark, annotatedscamlight, annotatedscamdark)
	#inbox_email_dict = _add_dict_email_entry(inbox_email_dict, number, subject, explanation, true, legitlight, legitdark, annotatedlegitlight, annotatedlegitdark)
	
	
	return inbox_email_dict

func _example_number_pool_randomize():
	randomize()
	# Clearing the number pool
	number_pool_examples = []
	# Populate the pool with numbers
	for i in range(1, 36):
		number_pool_examples.append(i)
	# Shuffle the order
	number_pool_examples.shuffle()
	print(number_pool_examples)

func _example_legit_pool_randomize():
	randomize()
	# Clearing the legit number pool
	legit_number_pool_examples = []
	# Populate the pool with numbers
	for i in range(11, 21):
		legit_number_pool_examples.append(i)
	for i in range(31, 36):
		legit_number_pool_examples.append(i)
	# Shuffle the order
	legit_number_pool_examples.shuffle()
	print(legit_number_pool_examples)

func _example_scam_pool_randomize():
	randomize()
	# Clearing the legit number pool
	scam_number_pool_examples = []
	# Populate the pool with numbers
	for i in range(1, 11):
		scam_number_pool_examples.append(i)
	for i in range(21, 31):
		scam_number_pool_examples.append(i)
	# Shuffle the order
	scam_number_pool_examples.shuffle()
	print(scam_number_pool_examples)


# Drawing the current image on the examples screen
func _draw_example_image(current_theme, add):
	if example_email_type == 0: # If both legitimate and scam
		if add == 1:
			if number_pool_examples.size() == (current_example_email_index + 1):
				current_example_email_index = 0
			else:
				current_example_email_index = current_example_email_index + 1
		elif add == -1:
			if current_example_email_index == 0:
				current_example_email_index = number_pool_examples.size() - 1
			else:
				current_example_email_index = current_example_email_index - 1
		if example_annotated:
			_draw_email_based_on_theme(all_emails_dict[number_pool_examples[current_example_email_index]]["annotated_light"], all_emails_dict[number_pool_examples[current_example_email_index]]["annotated_dark"], current_theme)
		else:
			_draw_email_based_on_theme(all_emails_dict[number_pool_examples[current_example_email_index]]["light_image"], all_emails_dict[number_pool_examples[current_example_email_index]]["dark_image"], current_theme)
	elif example_email_type == 1: # If only legitimate
		if add == 1:
			if legit_number_pool_examples.size() == (current_example_email_index + 1):
				current_example_email_index = 0
			else:
				current_example_email_index = current_example_email_index + 1
		elif add == -1:
			if current_example_email_index == 0:
				current_example_email_index = legit_number_pool_examples.size() - 1
			else:
				current_example_email_index = current_example_email_index - 1
		if example_annotated:
			_draw_email_based_on_theme(all_emails_dict[legit_number_pool_examples[current_example_email_index]]["annotated_light"], all_emails_dict[legit_number_pool_examples[current_example_email_index]]["annotated_dark"], current_theme)
		else:
			_draw_email_based_on_theme(all_emails_dict[legit_number_pool_examples[current_example_email_index]]["light_image"], all_emails_dict[legit_number_pool_examples[current_example_email_index]]["dark_image"], current_theme)
	else: # If only scam
		if add == 1:
			if scam_number_pool_examples.size() == (current_example_email_index + 1):
				current_example_email_index = 0
			else:
				current_example_email_index = current_example_email_index + 1
		elif add == -1:
			if current_example_email_index == 0:
				current_example_email_index = scam_number_pool_examples.size() - 1
			else:
				current_example_email_index = current_example_email_index - 1
		if example_annotated:
			_draw_email_based_on_theme(all_emails_dict[scam_number_pool_examples[current_example_email_index]]["annotated_light"], all_emails_dict[scam_number_pool_examples[current_example_email_index]]["annotated_dark"], current_theme)
		else:
			_draw_email_based_on_theme(all_emails_dict[scam_number_pool_examples[current_example_email_index]]["light_image"], all_emails_dict[scam_number_pool_examples[current_example_email_index]]["dark_image"], current_theme)
	# Scale by half to properly fit the bottom right of the screen
	scale = Vector2(0.5, 0.5)
	# Set the position to x: 805, y: 404 (to fit in the bottom right of the screen)
	position = Vector2(805, 404)
	

func _reset_current_example_email_index():
	current_example_email_index = 0

func _add_dict_email_entry(inbox_email_dict, key, subject, explanation, legitimate, light, dark, annotated_light, annotated_dark):
	var entry = {
		"subject": subject,
		"explanation": explanation,
		"legitimate": legitimate,
		"light_image": light,
		"dark_image": dark,
		"annotated_light": annotated_light,
		"annotated_dark": annotated_dark
	}
	inbox_email_dict[key] = entry
	return inbox_email_dict
