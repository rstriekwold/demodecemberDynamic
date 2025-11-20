*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    Determine Login Strategy
    # Appstate                  Home
    LaunchApp                 Sales
    sleep                     3
    LogScreenshot