--  Shh! by Colin Devroe | http://cdevroe.com/
--  http://github.com/cdevroe/shh

-- Applications to close

-- ## Twitter
tell application "Twitter"
	quit
end tell

-- ## Skype
tell application "Skype"
	quit
end tell

-- ## Mail
tell application "Mail"
	quit
end tell

-- ## iChat
tell application "iChat"
	quit
end tell

-- / End Applications to close



-- Services to turn off


-- ## Growl
tell application "System Events"
    set isRunning_Growl to (count of (every process whose name is "GrowlHelperApp")) > 0
end tell

if isRunning_Growl then
    tell application "GrowlHelperApp"
        set the allNotificationsList to {"Growl Toggler"}
        register as application "Growl Toggler" all notifications allNotificationsList default notifications allNotificationsList
        notify with name "Growl Toggler" title "Notifications OFF" description "" application name "Growl Toggler" icon of application "Automator"
    end tell
    delay (2)
    tell application "GrowlHelperApp" to quit
else
    tell application "GrowlHelperApp" to launch
    tell application "GrowlHelperApp"
        set the allNotificationsList to {"Growl Toggler"}
        register as application "Growl Toggler" all notifications allNotificationsList default notifications allNotificationsList
        notify with name "Growl Toggler" title "Notifications ON" description "" application name "Growl Toggler" icon of application "Automator"
    end tell
end if