*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    log                       ${loginUrl}
    log                       ${password}
    log                       ${username}
    Home
    LaunchApp                 Sales
    sleep                     3
    LogScreenshot