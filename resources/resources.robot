*** Settings ***
Library            SeleniumLibrary
Library            FakerLibrary    locale=pt_BR
Library            DateTime
#page resources
Resource          ../pages/Login/login.robot
Resource          ../pages/Mentor/homepage_mentor.robot
Resource          ../pages/Mentor/navbar.robot
Resource          ../pages/Mentor/class_registration.robot
Resource          ../pages/Mentor/class_verified.robot
Resource          ../pages/Mentor/class_withdraw.robot
Resource          ../pages/Mentor/class_remove.robot
Resource          ../pages/Mentor/send_feedback.robot
Resource          ../resources/users.robot
*** Variables ***
${URL}    https://transformers.labsit.io/
*** Keywords ***
New Session
    Open Browser    ${URL}    chrome
    Maximize Browser Window
Close Session
    Capture Page Screenshot
    Close Browser