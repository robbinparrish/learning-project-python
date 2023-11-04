#
# Simple test using browser with robotframework to validate the image.
#

*** Settings ***
Library    SeleniumLibrary
Library    XvfbRobot
Suite Setup    Start Virtual Display    1920    1080

*** Variables ***
${BROWSER}    %{BROWSER}
${ROBOT_URL}    https://robotframework.org/

*** Test Cases ***
Validate Browser As Per Requests
	IF    '${BROWSER}' == 'Chrome'
		ChromeBrowser
		Go To	${ROBOT_URL}
		Log To Console	Accessed ${ROBOT_URL} using ${BROWSER}.
		Capture Page Screenshot
	ELSE IF    '${BROWSER}' == 'Firefox'
		FirefoxBrowser
		Go To	${ROBOT_URL}
		Log To Console	Accessed ${ROBOT_URL} using ${BROWSER}.
		Capture Page Screenshot
	ELSE IF    '${BROWSER}' == 'Edge'
		EdgeBrowser
		Go To	${ROBOT_URL}
		Log To Console	Accessed ${ROBOT_URL} using ${BROWSER}.
		Capture Page Screenshot
	ELSE
		Log To Console  Browser is not provided or not supported.
	END

*** Keywords ***
ChromeBrowser
	${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
	Call Method    ${options}    add_argument    --no-sandbox
	Call Method    ${options}    add_argument    google-chrome
	Call Method    ${options}    add_argument    --headless
	Call Method    ${options}    add_argument    --disable-dev-shm-usage
	Create Webdriver    Chrome    options=${options}

FirefoxBrowser
	${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
	Call Method    ${options}    add_argument    --no-sandbox
	Call Method    ${options}    add_argument    gechodriver
	Call Method    ${options}    add_argument    --headless
	Call Method    ${options}    add_argument    --disable-dev-shm-usage
	Create Webdriver    Firefox    options=${options}

EdgeBrowser
	${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
	Call Method    ${options}    add_argument    --no-sandbox
	Call Method    ${options}    add_argument    microsoft-edge
	Call Method    ${options}    add_argument    --headless
	Call Method    ${options}    add_argument    --disable-dev-shm-usage
	Create Webdriver    Edge    options=${options}

