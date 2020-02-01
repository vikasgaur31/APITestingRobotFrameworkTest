*** Settings ***
Documentation  This script opens dialer on phone
Library  AppiumLibrary
Library  Collections
Documentation  This script opens dialer on phone
Library  AppiumLibrary
Library  Collections


*** Variables ***
${Device_name}   d83e7006
${Appium_server}  http://127.0.0.1:4723/wd/hub
${appPackage}  com.mi.android.globallauncher
${appActivity}  com.miui.home.launcher.Launcher
${platfrom}  9
${automationName}  uiautomator2

*** Test Cases ***
Open_Dialer
  setup and open dialer


*** Keywords ***
setup and open dialer
  ${androiddriver}=  Open Application  ${Appium_server}  platformName=android  platformVersion=${platfrom}  deviceName=${Device_name}  automationName=${automationName}
  ...  appPackage=${appPackage}  newCommandTimeout=2500  appActivity=${appActivity}