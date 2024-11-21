extends Control

# All the nodes
@onready var inbox_node = $InboxNode
@onready var tutorial_node = $TutorialNode
@onready var settings_node = $SettingsNode
@onready var archived_node = $ArchivedNode
@onready var reported_node = $ReportedNode
@onready var answers_node = $AnswersNode
@onready var resources_node = $ResourcesNode
@onready var examples_node = $ExamplesNode

@onready var email_button_1 = $InboxNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button
@onready var email_button_2 = $InboxNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button
@onready var email_button_3 = $InboxNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button
@onready var email_button_4 = $InboxNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button
@onready var email_button_5 = $InboxNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button

@onready var archived_button_1 = $ArchivedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button
@onready var archived_button_2 = $ArchivedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button
@onready var archived_button_3 = $ArchivedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button
@onready var archived_button_4 = $ArchivedNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button
@onready var archived_button_5 = $ArchivedNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button
@onready var report_button_archived_screen = $ArchivedNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button

@onready var reported_button_1 = $ReportedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button
@onready var reported_button_2 = $ReportedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button
@onready var reported_button_3 = $ReportedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button
@onready var reported_button_4 = $ReportedNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button
@onready var reported_button_5 = $ReportedNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button
@onready var archive_button_reported_screen = $ReportedNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button

@onready var answers_button_1 = $AnswersNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button
@onready var answers_button_2 = $AnswersNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button
@onready var answers_button_3 = $AnswersNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button
@onready var answers_button_4 = $AnswersNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button
@onready var answers_button_5 = $AnswersNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button

@onready var archive_button = $InboxNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button
@onready var report_button = $InboxNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button
@onready var email_buttons_back_panel = $InboxNode/EmailButtonsPanel

# Themes Light
var light_theme1 : Theme = preload("res://Assets/ThemesLight/InboxSpecific/email_buttons_panel.tres")
var light_theme3 : Theme = preload("res://Assets/ThemesLight/InboxSpecific/email_panel.tres")
var light_theme4 : Theme = preload("res://Assets/ThemesLight/InboxSpecific/email_sender_info_panel.tres")
var light_theme5 : Theme = preload("res://Assets/ThemesLight/InboxSpecific/top_only_email_buttons_panel.tres")
var light_theme6 : Theme = preload("res://Assets/ThemesLight/TutorialSpecific/tutorial_panel.tres")
var light_theme7 : Theme = preload("res://Assets/ThemesLight/left_button_email_classification_panels.tres")
var light_theme8 : Theme = preload("res://Assets/ThemesLight/upper_panel.tres")
var light_theme9 : Theme = preload("res://Assets/ThemesLight/example_settings.tres")

# Themes Dark
var dark_theme1 : Theme = preload("res://Assets/ThemesDark/InboxSpecific/email_buttons_panel.tres")
var dark_theme3 : Theme = preload("res://Assets/ThemesDark/InboxSpecific/email_panel.tres")
var dark_theme4 : Theme = preload("res://Assets/ThemesDark/InboxSpecific/email_sender_info_panel.tres")
var dark_theme5 : Theme = preload("res://Assets/ThemesDark/InboxSpecific/top_only_email_buttons_panel.tres")
var dark_theme6 : Theme = preload("res://Assets/ThemesDark/TutorialSpecific/tutorial_panel.tres")
var dark_theme7 : Theme = preload("res://Assets/ThemesDark/left_button_email_classification_panels.tres")
var dark_theme8 : Theme = preload("res://Assets/ThemesDark/upper_panel.tres")
var dark_theme9 : Theme = preload("res://Assets/ThemesDark/example_settings.tres")

@onready var choosing_emails = get_node("Scripts/ChoosingEmails")

@onready var paused = false
@onready var started_video_first_time = false

var answers_submitted = false

@onready var chosen_theme = 1 # 1 = light, 2 = dark

# Additional Tutorial Variables
@onready var tutorial_unpause_button = $TutorialNode/Panel/UnpauseButtonContainer
@onready var tutorial_pause_button = $TutorialNode/Panel/PauseButtonContainer
@onready var tutorial_video_player = $TutorialNode/Panel/TutorialVideoPlayer

# 0 is annotated, 1 is original, 2 is text
var current_answer_preference = 0
var more_options = false

func _ready():
	randomize() # Randomizes the seed
	tutorial_video_player.set_paused(true)
	_generate_buttons_and_emails()
	_on_tutorial_pressed()
	_on_clean_display_button_pressed()

# ========== LEFT PANEL BUTTON FUNCTIONS ============

func _on_inbox_pressed() -> void: # Inbox Button
	if not answers_submitted:
		show_items(inbox_node)
		hide_items(answers_node)
		hide_items(tutorial_node)
		hide_items(settings_node)
		hide_items(archived_node)
		hide_items(reported_node)
		hide_items(resources_node)
		hide_items(examples_node)
		choosing_emails._remove_email_drawing()
		if email_button_1.visible: # If there are emails still
			$InboxNode/EmailButtonsPanel.show()
			$InboxNode/InboxEmptyText.hide()
			if email_button_2.hidden: # If there is only one email
				choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[0], choosing_emails.inbox_email_dict, 0, chosen_theme)
			else: # If there is more than one email
				choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[choosing_emails.get_current_email_button_location()], choosing_emails.inbox_email_dict, choosing_emails.get_current_email_button_location(), chosen_theme)
		else:
			$InboxNode/EmailButtonsPanel.hide()
			$InboxNode/InboxEmptyText.show()
		tutorial_video_player.set_paused(true)
	else:
		choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[0])
		show_items(answers_node)
		hide_items(inbox_node)
		hide_items(tutorial_node)
		hide_items(settings_node)
		hide_items(archived_node)
		hide_items(reported_node)
		hide_items(resources_node)
		hide_items(examples_node)
		# If the user does not select more options, hide the ability to change the type of feedback given
		# Also, set the current answer preference to the default
		if not more_options:
			$AnswersNode/EmailClassificationPanel/AnnotatedButtonContainer/VBoxContainer/Button.hide()
			$AnswersNode/EmailClassificationPanel/TextButtonContainer/VBoxContainer/Button.hide()
			$AnswersNode/EmailClassificationPanel/OriginalButtonContainer/VBoxContainer/Button.hide()
			current_answer_preference = 0
		else:
			$AnswersNode/EmailClassificationPanel/AnnotatedButtonContainer/VBoxContainer/Button.show()
			$AnswersNode/EmailClassificationPanel/TextButtonContainer/VBoxContainer/Button.show()
			$AnswersNode/EmailClassificationPanel/OriginalButtonContainer/VBoxContainer/Button.show()
		choosing_emails._remove_email_drawing()
		tutorial_video_player.set_paused(true)
		_show_correct_answer_message(0)
		# Drawing in the first email explanation based on preference
		if current_answer_preference == 0:
			_on_annotated_button_pressed()
		elif current_answer_preference == 1:
			_on_original_button_pressed()
		else:
			_on_text_button_pressed()
		# Print user score on the screen
		var tmp_int = 0
		for answer in choosing_emails.get_user_answers():
			if answer:
				tmp_int = tmp_int + 1
		$AnswersNode/CurrentScoreText.text = "[center]" + str(tmp_int) + "/5"


func _on_archived_button_pressed() -> void:
	show_items(archived_node)
	hide_items(answers_node)
	hide_items(reported_node)
	hide_items(inbox_node)
	hide_items(tutorial_node)
	hide_items(settings_node)
	hide_items(resources_node)
	hide_items(examples_node)
	choosing_emails._remove_email_drawing()
	if archived_button_1.visible: # If there are emails still
		$ArchivedNode/EmailButtonsPanel.show()
		$ArchivedNode/ArchivedEmptyText.hide()
		$ArchivedNode/EmailPanel/Panel.hide()
		# Update the button text to make sure it is the most accurate
		_generate_buttons_and_emails_from_archived()
		# Set the current archived email to the first email
		choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[0])
		report_button_archived_screen.show()
		if archived_button_2.hidden: # If there is only one email
			choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[0], choosing_emails.archived_email_dict, 0, chosen_theme)
		else: # If there is more than one email
			choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[choosing_emails.get_archived_email_button_location()], choosing_emails.archived_email_dict, choosing_emails.get_archived_email_button_location(), chosen_theme)
	else:
		report_button_archived_screen.hide()
		$ArchivedNode/EmailButtonsPanel.hide()
		$ArchivedNode/ArchivedEmptyText.show()
		$ArchivedNode/EmailPanel/Panel.show()
	tutorial_video_player.set_paused(true)
	
func _on_reported_button_pressed() -> void:
	show_items(reported_node)
	hide_items(answers_node)
	hide_items(archived_node)
	hide_items(inbox_node)
	hide_items(tutorial_node)
	hide_items(settings_node)
	hide_items(resources_node)
	hide_items(examples_node)
	choosing_emails._remove_email_drawing()
	if reported_button_1.visible: # If there are emails still
		$ReportedNode/EmailButtonsPanel.show()
		$ReportedNode/ReportedEmptyText.hide()
		$ReportedNode/EmailPanel/Panel.hide()
		# Update the button text to make sure it is the most accurate
		_generate_buttons_and_emails_from_reported()
		# Set the current reported email to the first email
		choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[0])
		
		archive_button_reported_screen.show()
		if reported_button_2.hidden: # If there is only one email
			choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[0], choosing_emails.reported_email_dict, 0, chosen_theme)
		else: # If there is more than one email
			choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[choosing_emails.get_reported_email_button_location()], choosing_emails.reported_email_dict, choosing_emails.get_reported_email_button_location(), chosen_theme)
	else:
		archive_button_reported_screen.hide()
		$ReportedNode/EmailButtonsPanel.hide()
		$ReportedNode/ReportedEmptyText.show()
		$ReportedNode/EmailPanel/Panel.show()
	tutorial_video_player.set_paused(true)
	

func _on_resources_button_pressed() -> void: # Resources Button
	show_items(resources_node)
	hide_items(tutorial_node)
	hide_items(answers_node)
	hide_items(inbox_node)
	hide_items(settings_node)
	hide_items(archived_node)
	hide_items(reported_node)
	hide_items(examples_node)
	choosing_emails._remove_email_drawing()
	tutorial_video_player.set_paused(true)
	pass # Replace with function body.

func _on_examples_button_pressed() -> void:
	show_items(examples_node)
	hide_items(resources_node)
	hide_items(tutorial_node)
	hide_items(answers_node)
	hide_items(inbox_node)
	hide_items(settings_node)
	hide_items(archived_node)
	hide_items(reported_node)
	choosing_emails._remove_email_drawing()
	tutorial_video_player.set_paused(true)
	if not more_options:
		$ExamplesNode/LeftOptionsPanel/EmailTypeButtonContainer/VBoxContainer/Button.hide()
		$ExamplesNode/LeftOptionsPanel/CurrentTypeLabel.hide()
		$ExamplesNode/LeftOptionsPanel/AnnotationButtonContainer/VBoxContainer/Button.hide()
		$ExamplesNode/LeftOptionsPanel/CurrentAnnotationLabel.hide()
		$ExamplesNode/LeftOptionsPanel/RandomizeButtonContainer/VBoxContainer/Button.hide()
	else:
		$ExamplesNode/LeftOptionsPanel/EmailTypeButtonContainer/VBoxContainer/Button.show()
		$ExamplesNode/LeftOptionsPanel/CurrentTypeLabel.show()
		$ExamplesNode/LeftOptionsPanel/AnnotationButtonContainer/VBoxContainer/Button.show()
		$ExamplesNode/LeftOptionsPanel/CurrentAnnotationLabel.show()
		$ExamplesNode/LeftOptionsPanel/RandomizeButtonContainer/VBoxContainer/Button.show()
	choosing_emails._draw_example_image(chosen_theme, 0)
	_change_example_screen_text()
		

func _on_tutorial_pressed() -> void: # Tutorial Button
	show_items(tutorial_node)
	hide_items(answers_node)
	hide_items(inbox_node)
	hide_items(settings_node)
	hide_items(archived_node)
	hide_items(reported_node)
	hide_items(resources_node)
	hide_items(examples_node)
	if not paused:
		tutorial_unpause_button.visible = false
		tutorial_pause_button.visible = true
		tutorial_video_player.set_paused(false)
	else:
		tutorial_pause_button.visible = false
		tutorial_unpause_button.visible = true
		tutorial_video_player.set_paused(true)
	if not started_video_first_time:
		tutorial_unpause_button.visible = true
		tutorial_pause_button.visible = false
		tutorial_video_player.set_paused(true)
		paused = true
		started_video_first_time = true
	choosing_emails._remove_email_drawing()
	$TutorialNode/Panel/TutorialVideoPlayer.hide()
	$TutorialNode/Panel/PauseButtonContainer.hide()
	$TutorialNode/Panel/UnpauseButtonContainer.hide()

func _on_submit_answers_button_pressed() -> void:
	# ============ HIDE NOT RELEVANT THINGS, SHOW RELEVANT THINGS ============
	show_items(answers_node)
	hide_items(inbox_node)
	hide_items(tutorial_node)
	hide_items(settings_node)
	hide_items(archived_node)
	hide_items(reported_node)
	hide_items(resources_node)
	hide_items(examples_node)
	# Hide the Archived / Reported / Submit Answers / Archive / Report buttons, as the game has been completed
	$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.hide()
	$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.hide()
	$InboxNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.hide()
	$InboxNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button.hide()
	$InboxNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button.hide()
	choosing_emails._remove_email_drawing()
	
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[0])
	
	# If the user does not select more options, hide the ability to change the type of feedback given
	# Also, set the current answer preference to the default
	if not more_options:
		$AnswersNode/EmailClassificationPanel/AnnotatedButtonContainer/VBoxContainer/Button.hide()
		$AnswersNode/EmailClassificationPanel/TextButtonContainer/VBoxContainer/Button.hide()
		$AnswersNode/EmailClassificationPanel/OriginalButtonContainer/VBoxContainer/Button.hide()
		current_answer_preference = 0
	else:
		$AnswersNode/EmailClassificationPanel/AnnotatedButtonContainer/VBoxContainer/Button.show()
		$AnswersNode/EmailClassificationPanel/TextButtonContainer/VBoxContainer/Button.show()
		$AnswersNode/EmailClassificationPanel/OriginalButtonContainer/VBoxContainer/Button.show()
		
	
	# Updating button text
	_generate_buttons_and_emails_from_answer()
	
	# Drawing in the first email explanation based on preference
	if current_answer_preference == 0:
		_on_annotated_button_pressed()
	elif current_answer_preference == 1:
		_on_original_button_pressed()
	else:
		_on_text_button_pressed()
	
	# Updating the array of answers
	var tmp_array = []
	for number in choosing_emails.get_selected_numbers_static():
		# If the email is in the archived dict, append true if it is legitimate and false otherwise
		if choosing_emails.get_archived_email_dict().has(number):
			tmp_array = choosing_emails.get_user_answers()
			tmp_array.append(choosing_emails.get_archived_email_dict()[number]["legitimate"])
			choosing_emails.set_user_answers(tmp_array)
			# If the email is in the reported dict, append true if it is a scam and false otherwise
		elif choosing_emails.get_reported_email_dict().has(number):
			tmp_array = choosing_emails.get_user_answers()
			if not choosing_emails.get_reported_email_dict()[number]["legitimate"]:
				tmp_array.append(true)
			else:
				tmp_array.append(false)
			choosing_emails.set_user_answers(tmp_array)
		else:
			tmp_array = choosing_emails.get_user_answers()
			tmp_array.append(false)
			choosing_emails.set_user_answers(tmp_array)
	answers_submitted = true
	_show_correct_answer_message(0)
	
	# Print user score on the screen
	var tmp_int = 0
	for answer in choosing_emails.get_user_answers():
		if answer:
			tmp_int = tmp_int + 1
	$AnswersNode/CurrentScoreText.text = "[center]" + str(tmp_int) + "/5"


func _on_settings_pressed() -> void:
	show_items(settings_node)
	hide_items(answers_node)
	hide_items(inbox_node)
	hide_items(tutorial_node)
	hide_items(archived_node)
	hide_items(reported_node)
	hide_items(resources_node)
	hide_items(examples_node)
	tutorial_video_player.set_paused(true)
	choosing_emails._remove_email_drawing()

func _on_reset_button_pressed() -> void:
	choosing_emails.set_archived_email_dict({})
	choosing_emails.set_reported_email_dict({})
	choosing_emails.set_email_dict({})
	choosing_emails.set_current_email(1)
	choosing_emails.set_current_archived_email(1)
	choosing_emails.set_current_reported_email(1)
	choosing_emails.set_selected_numbers([])
	choosing_emails.set_archived_numbers([])
	choosing_emails.set_reported_numbers([])
	choosing_emails.set_user_answers([]) # set the user answers to a blank array
	
	# After the proper vars are reset, run the proper tasks to reset the game
	choosing_emails._tasks_in_ready()
	
	email_button_1.show()
	email_button_2.show()
	email_button_3.show()
	email_button_4.show()
	email_button_5.show()
	
	archived_button_1.hide()
	archived_button_2.hide()
	archived_button_3.hide()
	archived_button_4.hide()
	archived_button_5.hide()
	
	reported_button_1.hide()
	reported_button_2.hide()
	reported_button_3.hide()
	reported_button_4.hide()
	reported_button_5.hide()
	
	$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.show()
	$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.show()
	$InboxNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button.show()
	$InboxNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button.show()
	$InboxNode/EmailClassificationPanel/HintButtonContainer/VBoxContainer/Button.show()
	$InboxNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.show()
	
	if not more_options:
		$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.hide()
		$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.hide()
	
	answers_submitted = false
	show_items($LeftButtonPanel)
	_on_inbox_pressed()
	_generate_buttons_and_emails()
	pass # Replace with function body.

func _show_correct_answer_message(relevant_number):
	var index = choosing_emails.get_selected_numbers_static()[relevant_number]
	# Hide all answer message info to start
	$AnswersNode/IncorrectIcon.hide()
	$AnswersNode/CorrectIcon.hide()
	$AnswersNode/ScamIncorrect.hide()
	$AnswersNode/LegitIncorrect.hide()
	$AnswersNode/LegitCorrect.hide()
	$AnswersNode/ScamCorrect.hide()
	# If the current email is correctly identified...
	if choosing_emails.get_user_answers()[relevant_number]:
		$AnswersNode/CorrectIcon.show() # Show the check mark
		if choosing_emails.get_all_emails_dict()[index]["legitimate"]:
			$AnswersNode/LegitCorrect.show()
		else:
			$AnswersNode/ScamCorrect.show()
	# If the current email is incorrectly identified...
	else:
		$AnswersNode/IncorrectIcon.show() # Show the "x"
		if choosing_emails.get_all_emails_dict()[index]["legitimate"]:
			$AnswersNode/LegitIncorrect.show()
		else:
			$AnswersNode/ScamIncorrect.show()
	

# ===== Function to generate all emails and write the appropriate subjects on buttons =====
func _generate_buttons_and_emails():
	if email_button_5.is_visible():
		_generate_button_text("InboxNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[0]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[1]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[2]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[3]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[4]]["subject"])
	elif email_button_4.is_visible():
		_generate_button_text("InboxNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[0]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[1]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[2]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[3]]["subject"])
	elif email_button_3.is_visible():
		_generate_button_text("InboxNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[0]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[1]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[2]]["subject"])
	elif email_button_2.is_visible():
		_generate_button_text("InboxNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[0]]["subject"])
		_generate_button_text("InboxNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[1]]["subject"])
	elif email_button_1.is_visible():
		_generate_button_text("InboxNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_email_dict()[choosing_emails.get_selected_numbers()[0]]["subject"])
	else:
		pass

func _generate_buttons_and_emails_from_archived():
	if archived_button_5.is_visible():
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[0]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[1]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[2]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[3]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[4]]["subject"])
	elif archived_button_4.is_visible():
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[0]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[1]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[2]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[3]]["subject"])
	elif archived_button_3.is_visible():
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[0]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[1]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[2]]["subject"])
	elif archived_button_2.is_visible():
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[0]]["subject"])
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[1]]["subject"])
	elif archived_button_1.is_visible():
		_generate_button_text("ArchivedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_archived_email_dict()[choosing_emails.get_archived_numbers()[0]]["subject"])
	else:
		pass

func _generate_buttons_and_emails_from_reported():
	if reported_button_5.is_visible():
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[0]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[1]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[2]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[3]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[4]]["subject"])
	elif reported_button_4.is_visible():
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[0]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[1]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[2]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[3]]["subject"])
	elif reported_button_3.is_visible():
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[0]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[1]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[2]]["subject"])
	elif reported_button_2.is_visible():
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[0]]["subject"])
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[1]]["subject"])
	elif reported_button_1.is_visible():
		_generate_button_text("ReportedNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_reported_email_dict()[choosing_emails.get_reported_numbers()[0]]["subject"])
	else:
		pass

func _generate_buttons_and_emails_from_answer():
	_generate_button_text("AnswersNode/EmailButtonsPanel/Email1Container/VBoxContainer/Button", choosing_emails.get_all_emails_dict()[choosing_emails.get_selected_numbers_static()[0]]["subject"])
	_generate_button_text("AnswersNode/EmailButtonsPanel/Email2Container/VBoxContainer/Button", choosing_emails.get_all_emails_dict()[choosing_emails.get_selected_numbers_static()[1]]["subject"])
	_generate_button_text("AnswersNode/EmailButtonsPanel/Email3Container/VBoxContainer/Button", choosing_emails.get_all_emails_dict()[choosing_emails.get_selected_numbers_static()[2]]["subject"])
	_generate_button_text("AnswersNode/EmailButtonsPanel/Email4Container/VBoxContainer/Button", choosing_emails.get_all_emails_dict()[choosing_emails.get_selected_numbers_static()[3]]["subject"])
	_generate_button_text("AnswersNode/EmailButtonsPanel/Email5Container/VBoxContainer/Button", choosing_emails.get_all_emails_dict()[choosing_emails.get_selected_numbers_static()[4]]["subject"])

func _generate_button_text(path, text):
	var inbox_button = get_node(path)
	inbox_button._add_button_text(text)



# ========== TUTORIAL BUTTON FUNCTIONS (pause / unpause) ============

func _on_pause_pressed() -> void:
	if tutorial_video_player and tutorial_video_player is VideoStreamPlayer:
		tutorial_video_player.set_paused(true) # Pause the video
		paused = true
	else:
		print("Error: Tutorial video player not found or not a VideoPlayer node.")
	tutorial_unpause_button.visible = true # Show the unpause button
	tutorial_pause_button.visible = false # Hide the pause button

func _on_unpause_pressed() -> void:
	if tutorial_video_player and tutorial_video_player is VideoStreamPlayer:
		tutorial_video_player.set_paused(false) # Unpause the video
		paused = false
	else:
		print("Error: Tutorial video player not found or not a VideoPlayer node.")
	tutorial_unpause_button.visible = false # Hide the unpause button
	tutorial_pause_button.visible = true # Show the pause button




# A function to hide node children
func hide_items(node_to_hide: Node):
	for child in node_to_hide.get_children():
		child.visible = false

# A function to display node children
func show_items(node_to_show: Node):
	for child in node_to_show.get_children():
		child.visible = true



func _on_first_email_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[0], choosing_emails.inbox_email_dict, 1, chosen_theme)
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[0])

func _on_second_email_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[1], choosing_emails.inbox_email_dict, 2, chosen_theme)
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[1])

func _on_third_email_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[2], choosing_emails.inbox_email_dict, 3, chosen_theme)
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[2])

func _on_fourth_email_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[3], choosing_emails.inbox_email_dict, 4, chosen_theme)
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[3])

func _on_fifth_email_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_selected_numbers()[4], choosing_emails.inbox_email_dict, 5, chosen_theme)
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[4])

func _on_first_archived_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[0], choosing_emails.archived_email_dict, 1, chosen_theme)
	choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[0])

func _on_second_archived_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[1], choosing_emails.archived_email_dict, 1, chosen_theme)
	choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[1])

func _on_third_archived_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[2], choosing_emails.archived_email_dict, 1, chosen_theme)
	choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[2])

func _on_fourth_archived_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[3], choosing_emails.archived_email_dict, 1, chosen_theme)
	choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[3])

func _on_fifth_archived_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_archived_numbers()[4], choosing_emails.archived_email_dict, 1, chosen_theme)
	choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[4])

func _on_first_reported_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[0], choosing_emails.reported_email_dict, 1, chosen_theme)
	choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[0])

func _on_second_reported_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[1], choosing_emails.reported_email_dict, 1, chosen_theme)
	choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[1])

func _on_third_reported_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[2], choosing_emails.reported_email_dict, 1, chosen_theme)
	choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[2])

func _on_fourth_reported_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[3], choosing_emails.reported_email_dict, 1, chosen_theme)
	choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[3])

func _on_fifth_reported_button_pressed() -> void:
	choosing_emails._draw_email_image(choosing_emails.get_reported_numbers()[4], choosing_emails.reported_email_dict, 1, chosen_theme)
	choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[4])

func _on_first_answer_button_pressed() -> void:
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[0])
	if current_answer_preference == 0:
		_on_annotated_button_pressed()
	elif current_answer_preference == 1:
		_on_original_button_pressed()
	else:
		_on_text_button_pressed()
	_show_correct_answer_message(0)

func _on_second_answer_button_pressed() -> void:
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[1])
	if current_answer_preference == 0:
		_on_annotated_button_pressed()
	elif current_answer_preference == 1:
		_on_original_button_pressed()
	else:
		_on_text_button_pressed()
	_show_correct_answer_message(1)

func _on_third_answer_button_pressed() -> void:
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[2])
	if current_answer_preference == 0:
		_on_annotated_button_pressed()
	elif current_answer_preference == 1:
		_on_original_button_pressed()
	else:
		_on_text_button_pressed()
	_show_correct_answer_message(2)

func _on_fourth_answer_button_pressed() -> void:
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[3])
	if current_answer_preference == 0:
		_on_annotated_button_pressed()
	elif current_answer_preference == 1:
		_on_original_button_pressed()
	else:
		_on_text_button_pressed()
	_show_correct_answer_message(3)

func _on_fifth_answer_button_pressed() -> void:
	choosing_emails.set_current_email(choosing_emails.get_selected_numbers_static()[4])
	if current_answer_preference == 0:
		_on_annotated_button_pressed()
	elif current_answer_preference == 1:
		_on_original_button_pressed()
	else:
		_on_text_button_pressed()
	_show_correct_answer_message(4)


func _on_light_mode_button_pressed() -> void:
	$SettingsNode/Panel/CurrentTypeLabel.text = "Current Theme: Light Mode"
	if chosen_theme == 2:
		chosen_theme = 1 # Switch the theme to light
		apply_theme(light_theme1, $InboxNode/EmailButtonsPanel)
		apply_theme(light_theme3, $InboxNode/EmailPanel)
		apply_theme(light_theme1, $InboxNode/EmailButtonsPanel/Email1Container)
		apply_theme(light_theme6, $TutorialNode/Panel)
		apply_theme(light_theme6, $SettingsNode/Panel)
		apply_theme(light_theme7, $SettingsNode/Panel/LightModeButtonContainer)
		apply_theme(light_theme7, $SettingsNode/Panel/DarkModeButtonContainer)
		apply_theme(light_theme7, $SettingsNode/Panel/CleanDisplayButtonContainer)
		apply_theme(light_theme7, $SettingsNode/Panel/MoreOptionsButtonContainer)
		apply_theme(light_theme7, $TutorialNode/Panel/PauseButtonContainer)
		apply_theme(light_theme7, $TutorialNode/Panel/UnpauseButtonContainer)
		apply_theme(light_theme7, $LeftButtonPanel)
		apply_theme(light_theme7, $InboxNode/EmailClassificationPanel)
		apply_theme(light_theme8, $UpperPanel)
		apply_theme(light_theme3, $ArchivedNode/EmailPanel)
		apply_theme(light_theme3, $ReportedNode/EmailPanel)
		apply_theme(light_theme1, $ArchivedNode/EmailButtonsPanel)
		apply_theme(light_theme7, $ArchivedNode/EmailClassificationPanel)
		apply_theme(light_theme1, $ArchivedNode/EmailButtonsPanel/Email1Container)
		apply_theme(light_theme1, $ReportedNode/EmailButtonsPanel)
		apply_theme(light_theme7, $ReportedNode/EmailClassificationPanel)
		apply_theme(light_theme1, $ReportedNode/EmailButtonsPanel/Email1Container)
		apply_theme(light_theme1, $InboxNode/InboxEmptyText)
		apply_theme(light_theme1, $ArchivedNode/ArchivedEmptyText)
		apply_theme(light_theme1, $ReportedNode/ReportedEmptyText)
		apply_theme(light_theme1, $AnswersNode/EmailButtonsPanel)
		apply_theme(light_theme7, $AnswersNode/EmailClassificationPanel)
		apply_theme(light_theme1, $AnswersNode/EmailButtonsPanel/Email1Container)
		apply_theme(light_theme1, $AnswersNode/ScamIncorrect)
		apply_theme(light_theme1, $AnswersNode/LegitIncorrect)
		apply_theme(light_theme1, $AnswersNode/LegitCorrect)
		apply_theme(light_theme1, $AnswersNode/ScamCorrect)
		apply_theme(light_theme1, $AnswersNode/EmailPanel)
		apply_theme(light_theme1, $AnswersNode/ExplanationText)
		apply_theme(light_theme3, $ResourcesNode/Panel)
		apply_theme(light_theme1, $ResourcesNode/ResourcesText)
		apply_theme(light_theme1, $ResourcesNode/ResourcesTextHeader)
		apply_theme(light_theme9, $ExamplesNode/LeftOptionsPanel)
		apply_theme(light_theme1, $ExamplesNode/EmailClassificationPanel/RichTextLabel)
		apply_theme(light_theme1, $ExamplesNode/LeftOptionsPanel/CurrentAnnotationLabel)
		apply_theme(light_theme1, $ExamplesNode/LeftOptionsPanel/CurrentTypeLabel)
		apply_theme(light_theme1, $ExamplesNode/LeftOptionsPanel/EmailSettingsLabel)
		apply_theme(light_theme3, $ExamplesNode/BackingPanel/Panel)
		apply_theme(light_theme1, $ExamplesNode/LeftOptionsPanel/CycleExplain)
		apply_theme(light_theme1, $SettingsNode/Panel/CurrentTypeLabel)
		apply_theme(light_theme1, $SettingsNode/Panel/CurrentDisplayLabel)
		apply_theme(light_theme1, $AnswersNode/CurrentRoundText)
		apply_theme(light_theme1, $AnswersNode/CurrentScoreText)
		apply_theme(light_theme1, $SettingsNode/Panel/ExplainDisplayLabel)
		$UpperPanel/MailboxButtonContainer/VBoxContainer/Button.icon = load("res://Assets/FullLogoLightTheme.png")
		$LeftButtonPanel/InboxButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/InboxIcon.png")
		$LeftButtonPanel/TutorialButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/InfoIcon.png")
		$LeftButtonPanel/OptionsButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SettingsIcon.png")
		$LeftButtonPanel/ResourcesButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/ResourcesIcon.png")
		$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SafeIcon.png")
		$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/ReportIcon.png")
		$InboxNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SafeIcon.png")
		$InboxNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/ReportIcon.png")
		$InboxNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SubmitIcon.png")
		$InboxNode/EmailClassificationPanel/HintButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/InfoIcon.png")
		$TutorialNode/Panel/PauseButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/PauseIcon.png")
		$TutorialNode/Panel/UnpauseButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/UnpauseIcon.png")
		$SettingsNode/Panel/LightModeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SunIcon.png")
		$SettingsNode/Panel/DarkModeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/MoonIcon.png")
		$SettingsNode/Panel/CleanDisplayButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/CleanDisplayIcon.png")
		$SettingsNode/Panel/MoreOptionsButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/MoreOptionsIcon.png")
		$ArchivedNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/ReportIcon.png")
		$ArchivedNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SubmitIcon.png")
		$ReportedNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SafeIcon.png")
		$ReportedNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/SubmitIcon.png")
		$AnswersNode/CorrectIcon.texture = load("res://Assets/BlackIcons/SubmitIcon.png")
		$AnswersNode/IncorrectIcon.texture = load("res://Assets/BlackIcons/IncorrectIcon.png")
		$AnswersNode/EmailClassificationPanel/ResetGameButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/ResetIcon.png")
		$AnswersNode/EmailClassificationPanel/AnnotatedButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/AnnotatedIcon.png")
		$AnswersNode/EmailClassificationPanel/OriginalButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/OriginalIcon.png")
		$AnswersNode/EmailClassificationPanel/TextButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/TextIcon.png")
		$LeftButtonPanel/ExamplesButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/TextIcon.png")
		$ExamplesNode/LeftOptionsPanel/EmailTypeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/ResetIcon.png")
		$ExamplesNode/LeftOptionsPanel/AnnotationButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/AnnotatedIcon.png")
		$ExamplesNode/LeftOptionsPanel/RandomizeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/RandomizeIcon.png")
		$ExamplesNode/LeftOptionsPanel/BackButtonContainer/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/BackIcon.png")
		$ExamplesNode/LeftOptionsPanel/NextButtonContainer2/VBoxContainer/Button.icon = load("res://Assets/BlackIcons/NextIcon.png")
		$TutorialNode/Panel/TutorialImage.texture = load("res://Assets/TutorialImages/MailboxTutorialLight.png")

func _on_dark_mode_button_pressed() -> void:
	$SettingsNode/Panel/CurrentTypeLabel.text = "Current Theme: Dark Mode"
	if chosen_theme == 1:
		chosen_theme = 2 # Switch the theme to dark
		apply_theme(dark_theme1, $InboxNode/EmailButtonsPanel)
		apply_theme(dark_theme3, $InboxNode/EmailPanel)
		apply_theme(dark_theme1, $InboxNode/EmailButtonsPanel/Email1Container)
		apply_theme(dark_theme6, $TutorialNode/Panel)
		apply_theme(dark_theme6, $SettingsNode/Panel)
		apply_theme(dark_theme7, $SettingsNode/Panel/LightModeButtonContainer)
		apply_theme(dark_theme7, $SettingsNode/Panel/DarkModeButtonContainer)
		apply_theme(dark_theme7, $SettingsNode/Panel/CleanDisplayButtonContainer)
		apply_theme(dark_theme7, $SettingsNode/Panel/MoreOptionsButtonContainer)
		apply_theme(dark_theme7, $TutorialNode/Panel/PauseButtonContainer)
		apply_theme(dark_theme7, $TutorialNode/Panel/UnpauseButtonContainer)
		apply_theme(dark_theme7, $LeftButtonPanel)
		apply_theme(dark_theme7, $InboxNode/EmailClassificationPanel)
		apply_theme(dark_theme8, $UpperPanel)
		apply_theme(dark_theme3, $ArchivedNode/EmailPanel)
		apply_theme(dark_theme3, $ReportedNode/EmailPanel)
		apply_theme(dark_theme1, $ArchivedNode/EmailButtonsPanel)
		apply_theme(dark_theme7, $ArchivedNode/EmailClassificationPanel)
		apply_theme(dark_theme1, $ArchivedNode/EmailButtonsPanel/Email1Container)
		apply_theme(dark_theme1, $ReportedNode/EmailButtonsPanel)
		apply_theme(dark_theme7, $ReportedNode/EmailClassificationPanel)
		apply_theme(dark_theme1, $ReportedNode/EmailButtonsPanel/Email1Container)
		apply_theme(dark_theme1, $InboxNode/EmailButtonsPanel)
		apply_theme(dark_theme1, $InboxNode/InboxEmptyText)
		apply_theme(dark_theme1, $ArchivedNode/ArchivedEmptyText)
		apply_theme(dark_theme1, $ReportedNode/ReportedEmptyText)
		apply_theme(dark_theme1, $AnswersNode/EmailButtonsPanel)
		apply_theme(dark_theme7, $AnswersNode/EmailClassificationPanel)
		apply_theme(dark_theme1, $AnswersNode/EmailButtonsPanel/Email1Container)
		apply_theme(dark_theme1, $AnswersNode/ScamIncorrect)
		apply_theme(dark_theme1, $AnswersNode/LegitIncorrect)
		apply_theme(dark_theme1, $AnswersNode/LegitCorrect)
		apply_theme(dark_theme1, $AnswersNode/ScamCorrect)
		apply_theme(dark_theme3, $AnswersNode/EmailPanel)
		apply_theme(dark_theme1, $AnswersNode/ExplanationText)
		apply_theme(dark_theme3, $ResourcesNode/Panel)
		apply_theme(dark_theme1, $ResourcesNode/ResourcesText)
		apply_theme(dark_theme1, $ResourcesNode/ResourcesTextHeader)
		apply_theme(dark_theme9, $ExamplesNode/LeftOptionsPanel)
		apply_theme(dark_theme1, $ExamplesNode/EmailClassificationPanel/RichTextLabel)
		apply_theme(dark_theme1, $ExamplesNode/LeftOptionsPanel/CurrentAnnotationLabel)
		apply_theme(dark_theme1, $ExamplesNode/LeftOptionsPanel/CurrentTypeLabel)
		apply_theme(dark_theme1, $ExamplesNode/LeftOptionsPanel/EmailSettingsLabel)
		apply_theme(dark_theme7, $ExamplesNode/BackingPanel/Panel)
		apply_theme(dark_theme1, $ExamplesNode/LeftOptionsPanel/CycleExplain)
		apply_theme(dark_theme1, $SettingsNode/Panel/CurrentTypeLabel)
		apply_theme(dark_theme1, $SettingsNode/Panel/CurrentDisplayLabel)
		apply_theme(dark_theme1, $AnswersNode/CurrentRoundText)
		apply_theme(dark_theme1, $AnswersNode/CurrentScoreText)
		apply_theme(dark_theme1, $SettingsNode/Panel/ExplainDisplayLabel)
		$UpperPanel/MailboxButtonContainer/VBoxContainer/Button.icon = load("res://Assets/FullLogoDarkTheme.png")
		$LeftButtonPanel/InboxButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/InboxIcon.png")
		$LeftButtonPanel/TutorialButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/InfoIcon.png")
		$LeftButtonPanel/OptionsButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SettingsIcon.png")
		$LeftButtonPanel/ResourcesButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/ResourcesIcon.png")
		$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SafeIcon.png")
		$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/ReportIcon.png")
		$InboxNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SafeIcon.png")
		$InboxNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/ReportIcon.png")
		$InboxNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SubmitIcon.png")
		$InboxNode/EmailClassificationPanel/HintButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/InfoIcon.png")
		$TutorialNode/Panel/PauseButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/PauseIcon.png")
		$TutorialNode/Panel/UnpauseButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/UnpauseIcon.png")
		$SettingsNode/Panel/LightModeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SunIcon.png")
		$SettingsNode/Panel/DarkModeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/MoonIcon.png")
		$SettingsNode/Panel/CleanDisplayButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/CleanDisplayIcon.png")
		$SettingsNode/Panel/MoreOptionsButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/MoreOptionsIcon.png")
		$ArchivedNode/EmailClassificationPanel/ReportButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/ReportIcon.png")
		$ArchivedNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SubmitIcon.png")
		$ReportedNode/EmailClassificationPanel/ArchiveButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SafeIcon.png")
		$ReportedNode/EmailClassificationPanel/SubmitAnswersButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/SubmitIcon.png")
		$AnswersNode/CorrectIcon.texture = load("res://Assets/WhiteIcons/SubmitIcon.png")
		$AnswersNode/IncorrectIcon.texture = load("res://Assets/WhiteIcons/IncorrectIcon.png")
		$AnswersNode/EmailClassificationPanel/ResetGameButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/ResetIcon.png")
		$AnswersNode/EmailClassificationPanel/AnnotatedButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/AnnotatedIcon.png")
		$AnswersNode/EmailClassificationPanel/OriginalButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/OriginalIcon.png")
		$AnswersNode/EmailClassificationPanel/TextButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/TextIcon.png")
		$LeftButtonPanel/ExamplesButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/TextIcon.png")
		$ExamplesNode/LeftOptionsPanel/EmailTypeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/ResetIcon.png")
		$ExamplesNode/LeftOptionsPanel/AnnotationButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/AnnotatedIcon.png")
		$ExamplesNode/LeftOptionsPanel/RandomizeButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/RandomizeIcon.png")
		$ExamplesNode/LeftOptionsPanel/BackButtonContainer/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/BackIcon.png")
		$ExamplesNode/LeftOptionsPanel/NextButtonContainer2/VBoxContainer/Button.icon = load("res://Assets/WhiteIcons/NextIcon.png")
		$TutorialNode/Panel/TutorialImage.texture = load("res://Assets/TutorialImages/MailboxTutorialDark.png")



func apply_theme(new_theme : Theme, location):
	# Apply the new theme to the object
	location.theme = new_theme


func _on_window_close_requested() -> void:
	$TmpPopUp/Window.visible = false

# When the archive button is pressed.
# ONLY FOR THE INBOX SCREEN
func _on_archive_button_pressed() -> void:
	# Hide the current email image
	choosing_emails._remove_email_drawing()
	# If the current button idex is greater than the current lowest button and it is not the last email, run the function that lands on the previous email
	# Basically, if this button is in the middle
	if (choosing_emails.get_current_email_button_location() > 1 and len(choosing_emails.get_email_dict()) > 1):
		# Reassign button locations and hide where necessary
		_reassign_buttons()
		
		#add to the archive dict, remove from regular one
		# Create a temporary dictionary to the archive and add the current email to it. Then make that the archive directory.
		var tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict[choosing_emails.get_current_email()] = choosing_emails.get_email_dict()[choosing_emails.get_current_email()]
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_email_dict()
		tmp_dict.erase(choosing_emails.get_current_email())
		choosing_emails.set_email_dict(tmp_dict)
		# Also, add this number from the list of archived numbers
		var tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.append(choosing_emails.get_current_email())
		choosing_emails.set_archived_numbers(tmp_array)
		_set_new_archived_button_text(choosing_emails.get_archived_email_dict()[choosing_emails.get_current_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_selected_numbers()
		tmp_array.erase(choosing_emails.get_current_email())
		choosing_emails.set_selected_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails()
		# Set the current email to the one above
		choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[choosing_emails.get_current_email_button_location() - 1])
		# Choose the image for the appropriate email
		choosing_emails._draw_email_image(choosing_emails.get_current_email(), choosing_emails.get_email_dict(), choosing_emails.get_current_email_button_location(), chosen_theme)
		
	elif len(choosing_emails.get_email_dict()) == 1: # If the current email is the last one, don't set it to another email after this
		# Delete the final button
		archived_button_1.hide()
		#add to the archive dict, remove from regular one
		# Create a temporary dictionary to the archive and add the current email to it. Then make that the archive directory.
		var tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict[choosing_emails.get_current_email()] = choosing_emails.get_email_dict()[choosing_emails.get_current_email()]
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_email_dict()
		tmp_dict.erase(choosing_emails.get_current_email())
		choosing_emails.set_email_dict(tmp_dict)
		# Also, add this number from the list of archived numbers
		var tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.append(choosing_emails.get_current_email())
		choosing_emails.set_archived_numbers(tmp_array)
		_set_new_archived_button_text(choosing_emails.get_archived_email_dict()[choosing_emails.get_current_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_selected_numbers()
		tmp_array.erase(choosing_emails.get_current_email())
		choosing_emails.set_selected_numbers(tmp_array)
		
	else: # Otherwise, run the function that lands on the next email
		
		# Reassign button locations and hide where necessary
		_reassign_buttons()
		
		#add to the archive dict, remove from regular one
		# Create a temporary dictionary to the archive and add the current email to it. Then make that the archive directory.
		var tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict[choosing_emails.get_current_email()] = choosing_emails.get_email_dict()[choosing_emails.get_current_email()]
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_email_dict()
		tmp_dict.erase(choosing_emails.get_current_email())
		choosing_emails.set_email_dict(tmp_dict)
		# Also, add this number from the list of archived numbers
		var tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.append(choosing_emails.get_current_email())
		choosing_emails.set_archived_numbers(tmp_array)
		# Set the text for the new archived button
		_set_new_archived_button_text(choosing_emails.get_archived_email_dict()[choosing_emails.get_current_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_selected_numbers()
		tmp_array.erase(choosing_emails.get_current_email())
		choosing_emails.set_selected_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails()
		if len(choosing_emails.get_selected_numbers()) > 0:
			# Set the current email to the one above
			choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[0])
			# Choose the image for the appropriate email
			choosing_emails._draw_email_image(choosing_emails.get_current_email(), choosing_emails.get_email_dict(), choosing_emails.get_current_email_button_location(), chosen_theme)
		
	# No matter what, show a new archived button
	_reveal_archived_button()
	if not email_button_1.is_visible():
		$InboxNode/EmailButtonsPanel.hide()
		$InboxNode/InboxEmptyText.show()
		$InboxNode/EmailClassificationPanel/ArchiveButtonContainer.hide()
		$InboxNode/EmailClassificationPanel/ReportButtonContainer.hide()
		$InboxNode/EmailClassificationPanel/HintButtonContainer.hide()

# When the report button is pressed.
# ONLY FOR THE INBOX SCREEN
func _on_report_button_pressed() -> void:
	
# Hide the current email image
	choosing_emails._remove_email_drawing()
	# If the current button idex is greater than the current lowest button and it is not the last email, run the function that lands on the previous email
	# Basically, if this button is in the middle
	if (choosing_emails.get_current_email_button_location() > 1 and len(choosing_emails.get_email_dict()) > 1):
		# Reassign button locations and hide where necessary
		_reassign_buttons()
		
		#add to the report dict, remove from regular one
		# Create a temporary dictionary to the report and add the current email to it. Then make that the report directory.
		var tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict[choosing_emails.get_current_email()] = choosing_emails.get_email_dict()[choosing_emails.get_current_email()]
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_email_dict()
		tmp_dict.erase(choosing_emails.get_current_email())
		choosing_emails.set_email_dict(tmp_dict)
		# Also, add this number from the list of reported numbers
		var tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.append(choosing_emails.get_current_email())
		choosing_emails.set_reported_numbers(tmp_array)
		_set_new_reported_button_text(choosing_emails.get_reported_email_dict()[choosing_emails.get_current_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_selected_numbers()
		tmp_array.erase(choosing_emails.get_current_email())
		choosing_emails.set_selected_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails()
		# Set the current email to the one above
		choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[choosing_emails.get_current_email_button_location() - 1])
		# Choose the image for the appropriate email
		choosing_emails._draw_email_image(choosing_emails.get_current_email(), choosing_emails.get_email_dict(), choosing_emails.get_current_email_button_location(), chosen_theme)
		
	elif len(choosing_emails.get_email_dict()) == 1: # If the current email is the last one, don't set it to another email after this
		# Delete the final button
		email_button_1.hide()
		#add to the report dict, remove from regular one
		# Create a temporary dictionary to the report and add the current email to it. Then make that the report directory.
		var tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict[choosing_emails.get_current_email()] = choosing_emails.get_email_dict()[choosing_emails.get_current_email()]
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_email_dict()
		tmp_dict.erase(choosing_emails.get_current_email())
		choosing_emails.set_email_dict(tmp_dict)
		# Also, add this number from the list of reported numbers
		var tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.append(choosing_emails.get_current_email())
		choosing_emails.set_reported_numbers(tmp_array)
		_set_new_reported_button_text(choosing_emails.get_reported_email_dict()[choosing_emails.get_current_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_selected_numbers()
		tmp_array.erase(choosing_emails.get_current_email())
		choosing_emails.set_selected_numbers(tmp_array)
		
	else: # Otherwise, run the function that lands on the next email
		
		# Reassign button locations and hide where necessary
		_reassign_buttons()
		
		#add to the report dict, remove from regular one
		# Create a temporary dictionary to the reported and add the current email to it. Then make that the report directory.
		var tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict[choosing_emails.get_current_email()] = choosing_emails.get_email_dict()[choosing_emails.get_current_email()]
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_email_dict()
		tmp_dict.erase(choosing_emails.get_current_email())
		choosing_emails.set_email_dict(tmp_dict)
		# Also, add this number from the list of reported numbers
		var tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.append(choosing_emails.get_current_email())
		choosing_emails.set_reported_numbers(tmp_array)
		# Set the text for the new reported button
		_set_new_reported_button_text(choosing_emails.get_reported_email_dict()[choosing_emails.get_current_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_selected_numbers()
		tmp_array.erase(choosing_emails.get_current_email())
		choosing_emails.set_selected_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails()
		if len(choosing_emails.get_selected_numbers()) > 0:
			# Set the current email to the one above
			choosing_emails.set_current_email(choosing_emails.get_selected_numbers()[0])
			# Choose the image for the appropriate email
			choosing_emails._draw_email_image(choosing_emails.get_current_email(), choosing_emails.get_email_dict(), choosing_emails.get_current_email_button_location(), chosen_theme)
		
	# No matter what, show a new reported button
	_reveal_reported_button()
	if not email_button_1.is_visible():
		$InboxNode/EmailButtonsPanel.hide()
		$InboxNode/InboxEmptyText.show()
		$InboxNode/EmailClassificationPanel/ArchiveButtonContainer.hide()
		$InboxNode/EmailClassificationPanel/ReportButtonContainer.hide()
		$InboxNode/EmailClassificationPanel/HintButtonContainer.hide()

# When the report button is pressed.
# ONLY FOR THE ARCHIVED SCREEN
func _on_report_button_pressed_from_archived() -> void:
	# Hide the current email image
	choosing_emails._remove_email_drawing()
	# If the current button idex is greater than the current lowest button and it is not the last email, run the function that lands on the previous email
	# Basically, if this button is in the middle
	if (choosing_emails.get_archived_email_button_location() > 1 and len(choosing_emails.get_archived_email_dict()) > 1):
		# Reassign button locations and hide where necessary
		_reassign_archived_buttons()
		
		#add to the report dict, remove from regular one
		# Create a temporary dictionary to the report and add the current email to it. Then make that the report directory.
		var tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict[choosing_emails.get_current_archived_email()] = choosing_emails.get_archived_email_dict()[choosing_emails.get_current_archived_email()]
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict.erase(choosing_emails.get_current_archived_email())
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Also, add this number from the list of reported numbers
		var tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.append(choosing_emails.get_current_archived_email())
		choosing_emails.set_reported_numbers(tmp_array)
		_set_new_reported_button_text(choosing_emails.get_reported_email_dict()[choosing_emails.get_current_archived_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.erase(choosing_emails.get_current_archived_email())
		choosing_emails.set_archived_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails_from_archived()
		# Set the current email to the one above
		choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[choosing_emails.get_archived_email_button_location() - 1])
		# Choose the image for the appropriate email
		choosing_emails._draw_email_image(choosing_emails.get_current_archived_email(), choosing_emails.get_archived_email_dict(), choosing_emails.get_archived_email_button_location(), chosen_theme)
	elif len(choosing_emails.get_archived_email_dict()) == 1: # If the current email is the last one, don't set it to another email after this
		# Delete the final button
		archived_button_1.hide()
		# Hide the option to report
		report_button_archived_screen.hide()
		#add to the report dict, remove from regular one
		# Create a temporary dictionary to the report and add the current email to it. Then make that the report directory.
		var tmp_dict = choosing_emails.get_reported_email_dict()
		
		tmp_dict[choosing_emails.get_current_archived_email()] = choosing_emails.get_archived_email_dict()[choosing_emails.get_current_archived_email()]
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict.erase(choosing_emails.get_current_archived_email())
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Also, add this number from the list of reported numbers
		var tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.append(choosing_emails.get_current_archived_email())
		choosing_emails.set_reported_numbers(tmp_array)
		_set_new_reported_button_text(choosing_emails.get_reported_email_dict()[choosing_emails.get_current_archived_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.erase(choosing_emails.get_current_archived_email())
		choosing_emails.set_archived_numbers(tmp_array)
		
	else: # Otherwise, run the function that lands on the next email
		
		# Reassign button locations and hide where necessary
		_reassign_archived_buttons()
		
		#add to the report dict, remove from regular one
		# Create a temporary dictionary to the reported and add the current email to it. Then make that the report directory.
		var tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict[choosing_emails.get_current_archived_email()] = choosing_emails.get_archived_email_dict()[choosing_emails.get_current_archived_email()]
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict.erase(choosing_emails.get_current_archived_email())
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Also, add this number from the list of reported numbers
		var tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.append(choosing_emails.get_current_archived_email())
		choosing_emails.set_reported_numbers(tmp_array)
		# Set the text for the new reported button
		_set_new_reported_button_text(choosing_emails.get_reported_email_dict()[choosing_emails.get_current_archived_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.erase(choosing_emails.get_current_archived_email())
		choosing_emails.set_archived_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails_from_archived()
		if len(choosing_emails.get_archived_numbers()) > 0:
			# Set the current email to the one above
			choosing_emails.set_current_archived_email(choosing_emails.get_archived_numbers()[0])
			# Choose the image for the appropriate email
			choosing_emails._draw_email_image(choosing_emails.get_current_archived_email(), choosing_emails.get_archived_email_dict(), choosing_emails.get_archived_email_button_location(), chosen_theme)
	# No matter what, show a new reported button
	_reveal_reported_button()
	if not archived_button_1.is_visible():
		$ArchivedNode/EmailButtonsPanel.hide()
		$ArchivedNode/ArchivedEmptyText.show()
		$ArchivedNode/EmailPanel/Panel.show()

# When the archive button is pressed.
# ONLY FOR THE REPORTED SCREEN
func _on_archive_button_pressed_from_reported() -> void:
# Hide the current email image
	choosing_emails._remove_email_drawing()
	# If the current button idex is greater than the current lowest button and it is not the last email, run the function that lands on the previous email
	# Basically, if this button is in the middle
	if (choosing_emails.get_reported_email_button_location() > 1 and len(choosing_emails.get_reported_email_dict()) > 1):
		# Reassign button locations and hide where necessary
		_reassign_reported_buttons()
		
		#add to the archive dict, remove from regular one
		# Create a temporary dictionary to the archive and add the current email to it. Then make that the archive directory.
		var tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict[choosing_emails.get_current_reported_email()] = choosing_emails.get_reported_email_dict()[choosing_emails.get_current_reported_email()]
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict.erase(choosing_emails.get_current_reported_email())
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Also, add this number from the list of archived numbers
		var tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.append(choosing_emails.get_current_reported_email())
		choosing_emails.set_archived_numbers(tmp_array)
		_set_new_archived_button_text(choosing_emails.get_archived_email_dict()[choosing_emails.get_current_reported_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.erase(choosing_emails.get_current_reported_email())
		choosing_emails.set_reported_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails_from_reported()
		# Set the current email to the one above
		choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[choosing_emails.get_reported_email_button_location() - 1])
		# Choose the image for the appropriate email
		choosing_emails._draw_email_image(choosing_emails.get_current_reported_email(), choosing_emails.get_reported_email_dict(), choosing_emails.get_reported_email_button_location(), chosen_theme)
	elif len(choosing_emails.get_reported_email_dict()) == 1: # If the current email is the last one, don't set it to another email after this
		# Delete the final button
		reported_button_1.hide()
		# Hide the option to archive
		archive_button_reported_screen.hide()
		#add to the archive dict, remove from regular one
		# Create a temporary dictionary to the archive and add the current email to it. Then make that the archive directory.
		var tmp_dict = choosing_emails.get_archived_email_dict()
		
		tmp_dict[choosing_emails.get_current_reported_email()] = choosing_emails.get_reported_email_dict()[choosing_emails.get_current_reported_email()]
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict.erase(choosing_emails.get_current_reported_email())
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Also, add this number from the list of archived numbers
		var tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.append(choosing_emails.get_current_reported_email())
		choosing_emails.set_archived_numbers(tmp_array)
		_set_new_archived_button_text(choosing_emails.get_archived_email_dict()[choosing_emails.get_current_reported_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.erase(choosing_emails.get_current_reported_email())
		choosing_emails.set_reported_numbers(tmp_array)
		
	else: # Otherwise, run the function that lands on the next email
		
		# Reassign button locations and hide where necessary
		_reassign_reported_buttons()
		
		#add to the archive dict, remove from regular one
		# Create a temporary dictionary to the archived and add the current email to it. Then make that the archive directory.
		var tmp_dict = choosing_emails.get_archived_email_dict()
		tmp_dict[choosing_emails.get_current_reported_email()] = choosing_emails.get_reported_email_dict()[choosing_emails.get_current_reported_email()]
		choosing_emails.set_archived_email_dict(tmp_dict)
		# Then, set the temporary dictionary to the inbox and remove the current email to it. Then make that the inbox directory.
		tmp_dict = choosing_emails.get_reported_email_dict()
		tmp_dict.erase(choosing_emails.get_current_reported_email())
		choosing_emails.set_reported_email_dict(tmp_dict)
		# Also, add this number from the list of archived numbers
		var tmp_array = choosing_emails.get_archived_numbers()
		tmp_array.append(choosing_emails.get_current_reported_email())
		choosing_emails.set_archived_numbers(tmp_array)
		# Set the text for the new archived button
		_set_new_archived_button_text(choosing_emails.get_archived_email_dict()[choosing_emails.get_current_reported_email()]['subject'])
		
		# Also, remove this number from the list of selected numbers
		tmp_array = choosing_emails.get_reported_numbers()
		tmp_array.erase(choosing_emails.get_current_reported_email())
		choosing_emails.set_reported_numbers(tmp_array)
		
		# Modify the text on the buttons, according to how many there are
		_generate_buttons_and_emails_from_reported()
		if len(choosing_emails.get_reported_numbers()) > 0:
			# Set the current email to the one above
			choosing_emails.set_current_reported_email(choosing_emails.get_reported_numbers()[0])
			# Choose the image for the appropriate email
			choosing_emails._draw_email_image(choosing_emails.get_current_reported_email(), choosing_emails.get_reported_email_dict(), choosing_emails.get_reported_email_button_location(), chosen_theme)
	# No matter what, show a new archived button
	_reveal_archived_button()
	if not reported_button_1.is_visible():
		$ReportedNode/EmailButtonsPanel.hide()
		$ReportedNode/ReportedEmptyText.show()
		$ReportedNode/EmailPanel/Panel.show()

# If the archive / report buttons are pressed FROM THE INBOX
func _on_archive_or_report_pressed() -> void:
	if not email_button_1.is_visible():
		archive_button.hide()
		report_button.hide()
		$InboxNode/EmailClassificationPanel/HintButtonContainer/VBoxContainer/Button.hide()

func _reassign_buttons():
	
	if choosing_emails.get_current_email_button_location() == 5:
		choosing_emails.set_current_email_button_location(4)
	elif choosing_emails.get_current_email_button_location() == 4:
		if email_button_5.is_visible():
			pass
		else:
			choosing_emails.set_current_email_button_location(3)
	elif choosing_emails.get_current_email_button_location() == 3:
		if email_button_5.is_visible() or email_button_4.is_visible():
			pass
		else:
			choosing_emails.set_current_email_button_location(2)
	elif choosing_emails.get_current_email_button_location() == 2:
		if email_button_5.is_visible() or email_button_4.is_visible() or email_button_3.is_visible():
			pass
		else:
			choosing_emails.set_current_email_button_location(1)
	else:
		choosing_emails.set_current_email_button_location(1)
	
	# Now that the new button location has been set, hide the one lowest on the screen
	if email_button_5.is_visible():
		email_button_5.hide()
	elif email_button_4.is_visible():
		email_button_4.hide()
	elif email_button_3.is_visible():
		email_button_3.hide()
	elif email_button_2.is_visible():
		email_button_2.hide()
	else:
		email_button_1.hide()

func _reassign_archived_buttons():
	
	if choosing_emails.get_archived_email_button_location() == 5:
		choosing_emails.set_archived_email_button_location(4)
	elif choosing_emails.get_archived_email_button_location() == 4:
		if archived_button_5.is_visible():
			pass
		else:
			choosing_emails.set_archived_email_button_location(3)
	elif choosing_emails.get_archived_email_button_location() == 3:
		if archived_button_5.is_visible() or archived_button_4.is_visible():
			pass
		else:
			choosing_emails.set_archived_email_button_location(2)
	elif choosing_emails.get_archived_email_button_location() == 2:
		if archived_button_5.is_visible() or archived_button_4.is_visible() or archived_button_3.is_visible():
			pass
		else:
			choosing_emails.set_archived_email_button_location(1)
	else:
		choosing_emails.set_archived_email_button_location(1)
	
	# Now that the new button location has been set, hide the one lowest on the screen
	if archived_button_5.is_visible():
		archived_button_5.hide()
	elif archived_button_4.is_visible():
		archived_button_4.hide()
	elif archived_button_3.is_visible():
		archived_button_3.hide()
	elif archived_button_2.is_visible():
		archived_button_2.hide()
	else:
		archived_button_1.hide()

func _reveal_archived_button():
	if archived_button_4.is_visible():
		archived_button_5.show()
	elif archived_button_3.is_visible():
		archived_button_4.show()
	elif archived_button_2.is_visible():
		archived_button_3.show()
	elif archived_button_1.is_visible():
		archived_button_2.show()
	else:
		archived_button_1.show()

func _set_new_archived_button_text(text):
	if archived_button_4.is_visible():
		archived_button_5._add_button_text(text)
	elif archived_button_3.is_visible():
		archived_button_4._add_button_text(text)
	elif archived_button_2.is_visible():
		archived_button_3._add_button_text(text)
	elif archived_button_1.is_visible():
		archived_button_2._add_button_text(text)
	else:
		archived_button_1._add_button_text(text)

func _reassign_reported_buttons():
		
	if choosing_emails.get_reported_email_button_location() == 5:
		choosing_emails.set_reported_email_button_location(4)
	elif choosing_emails.get_reported_email_button_location() == 4:
		if reported_button_5.is_visible():
			pass
		else:
			choosing_emails.set_reported_email_button_location(3)
	elif choosing_emails.get_reported_email_button_location() == 3:
		if reported_button_5.is_visible() or reported_button_4.is_visible():
			pass
		else:
			choosing_emails.set_reported_email_button_location(2)
	elif choosing_emails.get_reported_email_button_location() == 2:
		if reported_button_5.is_visible() or reported_button_4.is_visible() or reported_button_3.is_visible():
			pass
		else:
			choosing_emails.set_reported_email_button_location(1)
	else:
		choosing_emails.set_reported_email_button_location(1)
	
	# Now that the new button location has been set, hide the one lowest on the screen
	if reported_button_5.is_visible():
		reported_button_5.hide()
	elif reported_button_4.is_visible():
		reported_button_4.hide()
	elif reported_button_3.is_visible():
		reported_button_3.hide()
	elif reported_button_2.is_visible():
		reported_button_2.hide()
	else:
		reported_button_1.hide()

func _reveal_reported_button():
	if reported_button_4.is_visible():
		reported_button_5.show()
	elif reported_button_3.is_visible():
		reported_button_4.show()
	elif reported_button_2.is_visible():
		reported_button_3.show()
	elif reported_button_1.is_visible():
		reported_button_2.show()
	else:
		reported_button_1.show()
		
func _set_new_reported_button_text(text):
	if reported_button_4.is_visible():
		reported_button_5._add_button_text(text)
	elif reported_button_3.is_visible():
		reported_button_4._add_button_text(text)
	elif reported_button_2.is_visible():
		reported_button_3._add_button_text(text)
	elif reported_button_1.is_visible():
		reported_button_2._add_button_text(text)
	else:
		reported_button_1._add_button_text(text)


func _on_annotated_button_pressed() -> void:
	$AnswersNode/ExplanationText.hide()
	$AnswersNode/EmailPanel/Panel.hide()
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_annotated_image(choosing_emails.get_selected_numbers_static()[choosing_emails.get_selected_numbers_static().find(choosing_emails.get_current_email())], choosing_emails.get_all_emails_dict(), 0, chosen_theme)
	current_answer_preference = 0

func _on_original_button_pressed() -> void:
	$AnswersNode/ExplanationText.hide()
	$AnswersNode/EmailPanel/Panel.hide()
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_email_image(choosing_emails.get_selected_numbers_static()[choosing_emails.get_selected_numbers_static().find(choosing_emails.get_current_email())], choosing_emails.get_all_emails_dict(), 0, chosen_theme)
	current_answer_preference = 1

func _on_text_button_pressed() -> void:
	$AnswersNode/ExplanationText.show()
	$AnswersNode/EmailPanel/Panel.show()
	choosing_emails._remove_email_drawing()
	$AnswersNode/ExplanationText.text = choosing_emails.get_all_emails_dict()[choosing_emails.get_current_email()]["explanation"]
	#$AnswersNode/ExplanationText.add_text(choosing_emails.get_all_emails_dict()[choosing_emails.get_current_email()]["explanation"])
	current_answer_preference = 2

func _on_hint_button_pressed() -> void:
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_annotated_image(choosing_emails.get_selected_numbers_static()[choosing_emails.get_selected_numbers_static().find(choosing_emails.get_current_email())], choosing_emails.get_all_emails_dict(), 0, chosen_theme)

func _on_clean_display_button_pressed() -> void:
	more_options = false
	$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.hide()
	$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.hide()
	choosing_emails.set_example_email_type(2)
	choosing_emails.set_example_annotated(true)
	choosing_emails._reset_current_example_email_index()
	$SettingsNode/Panel/CurrentDisplayLabel.text = "Current Display: Clean Display"
	$SettingsNode/Panel/ExplainDisplayLabel.text = "[i]The [b]Clean Display[/b] has a simpler interface, but it doesn't have as many ways to customize."

func _on_more_options_button_pressed() -> void:
	more_options = true
	if not answers_submitted:
		$LeftButtonPanel/ArchivedButtonContainer/VBoxContainer/Button.show()
		$LeftButtonPanel/ReportedButtonContainer/VBoxContainer/Button.show()
	$SettingsNode/Panel/CurrentDisplayLabel.text = "Current Display: More Options"
	$SettingsNode/Panel/ExplainDisplayLabel.text = "[i]The [b]More Options[/b] display offers more ways to customize, but it has a more complicated interface."

# Randomizing the emails of the currently selected type that are shown in the examples section
func _on_randomize_examples_button_pressed() -> void:
	if choosing_emails.get_example_email_type() == 0:		# Legit AND Scam
		choosing_emails._example_number_pool_randomize()
	elif choosing_emails.get_example_email_type() == 1:		# Legit
		choosing_emails._example_legit_pool_randomize()
	else:													# Scam
		choosing_emails._example_scam_pool_randomize()
	choosing_emails._reset_current_example_email_index()
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_example_image(chosen_theme, 0)
	_change_example_screen_text()

# Rotating the type(s) of emails being displayed in the example section
func _on_change_example_type_button_pressed() -> void:
	if choosing_emails.get_example_email_type() == 0:
		choosing_emails.set_example_email_type(1)
		print(choosing_emails.get_example_email_type())
	elif choosing_emails.get_example_email_type() == 1:
		choosing_emails.set_example_email_type(2)
		print(choosing_emails.get_example_email_type())
	else:
		choosing_emails.set_example_email_type(0)
		print(choosing_emails.get_example_email_type())
	choosing_emails._reset_current_example_email_index()
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_example_image(chosen_theme, 0)
	_change_example_screen_text()


func _on_next_button_pressed() -> void:
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_example_image(chosen_theme, 1)
	_change_example_screen_text()


func _on_back_button_pressed() -> void:
	choosing_emails._remove_email_drawing()
	choosing_emails._draw_example_image(chosen_theme, -1)
	_change_example_screen_text()

# Changing the text on the example screen depending on what options the user has selected 
func _change_example_screen_text():
	# Correct example screen text based off of email type and annotation
	if choosing_emails.example_email_type == 0:
		if choosing_emails.example_annotated:
			$ExamplesNode/EmailClassificationPanel/RichTextLabel.text = "[center]Showing annotated legitimate and scam emails.[/center]"
		else:
			$ExamplesNode/EmailClassificationPanel/RichTextLabel.text = "[center]Showing non-annotated legitimate and scam emails.[/center]"
		$ExamplesNode/LeftOptionsPanel/CurrentTypeLabel.text = "[center]Type: All Emails[/center]"
	elif choosing_emails.example_email_type == 1:
		if choosing_emails.example_annotated:
			$ExamplesNode/EmailClassificationPanel/RichTextLabel.text = "[center]Showing annotated legitimate emails.[/center]"
		else:
			$ExamplesNode/EmailClassificationPanel/RichTextLabel.text = "[center]Showing non-annotated legitimate emails.[/center]"
		$ExamplesNode/LeftOptionsPanel/CurrentTypeLabel.text = "[center]Type: Legitimate Emails[/center]"
	else:
		if choosing_emails.example_annotated:
			$ExamplesNode/EmailClassificationPanel/RichTextLabel.text = "[center]Showing annotated scam emails.[/center]"
		else:
			$ExamplesNode/EmailClassificationPanel/RichTextLabel.text = "[center]Showing non-annotated scam emails.[/center]"
		$ExamplesNode/LeftOptionsPanel/CurrentTypeLabel.text = "[center]Type: Scam Emails[/center]"
	# Correct text based off of annotation
	if choosing_emails.example_annotated:
		$ExamplesNode/LeftOptionsPanel/CurrentAnnotationLabel.text = "[center]Annotation: On[/center]"
	else:
		$ExamplesNode/LeftOptionsPanel/CurrentAnnotationLabel.text = "[center]Annotation: Off[/center]"

func _on_example_annotated_button_pressed() -> void:
	if choosing_emails.get_example_annotated():
		choosing_emails.set_example_annotated(false)
	else:
		choosing_emails.set_example_annotated(true)
	choosing_emails._draw_example_image(chosen_theme, 0)
	_change_example_screen_text()
