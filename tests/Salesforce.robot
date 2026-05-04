*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    Login
    LaunchApp                 Sales
    sleep                     3
    LogScreenshot

     ${DYNAMIC_LOGIN}=           Get Variable Value          ${loginUrl}                 NoValuePassed
    IF                          '${DYNAMIC_LOGIN}' != 'NoValuePassed'
        IF                      '${ownuser}' == 'TRUE'
            User Login                                  ${username}                     	    ${password}  
        ELSE
            GoTo                ${loginUrl}
            log                 ${DYNAMIC_LOGIN}
        END
    ELSE
        ${login_status} =       IsText                      To access this page, you have to log in to Salesforce.                  2
        IF                      ${login_status}             ==                          False
        OpenBrowser             ${local_login_url}          ${BROWSER}
        TypeText                Username                    ${local_username}           delay=1
        TypeSecret              Password                    ${local_password}
        ClickText               Log In
    END