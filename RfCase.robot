*** Settings ***
Library           Selenium2Library    implicit_wait=5
Library           MyLibrary
Library           Screenshot

*** Test Cases ***
FirstCase
    open browser    https://www.baidu.com    CHROME
    maximize browser window
    Input Text    id=kw    Robot Framework
    Click Button    id=su
    sleep    3
    Element Text Should Be    xpath=//*[@id="1"]/h3/a/em[1]    Robot
    Take Screenshot    #图片保存到报告中
    Title Should Be    Robot Framework_百度搜索
    Close Browser

FindElement
    open browser    https://www.baidu.com    CHROME
    maximize browser window
    Input Text    id=kw    Robot Framework
    Comment    Input Text    name=wd    Robot Framework
    Comment    Input Text    class=s_ipt    Robot Framework
    Comment    Input Text    tag=input    Robot Framework
    Comment    Input Text    xpath=//*[@id="kw"]    Robot Framework
    Comment    Input Text    css=#kw    Robot Framework
    Click Button    id=su
    sleep    3
    Title Should Be    Robot Framework_百度搜索
    Click element    link=百度首页
    Comment    Click element    partial link=百度
    sleep    3
    ${title}    get title
    log    ${title}
    Close Browser

variable
    #Scalar
    ${Scalar1}    Set Variable    hello
    ${Scalar2}    Set Variable If    "${Scalar1}"=="hello"    jimmy    wrong
    ${Scalar3}    Get Time
    Run Keyword If    "${Scalar2}"=="jimmy"    log    You're smart
    log    ${Scalar1} ${Scalar2} ${Scalar3}
    #List
    Comment    @{list}    Create list    j    i    m    m
    ...    y
    Comment    Log Many    @{list}
    Comment    log    @{list}[3]@{list}[4]
    #Dict
    Comment    &{dict}    Create Dictionary    name=jimmy    Gender=male
    Comment    Log Many    &{dict}
    Comment    log    &{dict}[name]

Iframe
    open browser    http://car.waysdata.com    CHROME
    maximize browser window
    Click Element    xpath=//*[@id="components-login-form"]/div[2]/div/div/span/p[1]
    Input Text    css=#username    test
    Input Text    css=#password    ways123
    Click Element    css=#components-login-form > div.button.ant-row.ant-form-item > div > div > span > button
    Click Element    link=修改密码
    Select Frame    id=xubox_iframe1    #网页里搜iframe进行定位
    Current Frame Should Contain    text=修改密码
    Input Text    xpath=//*[@id="oldPassword"]    ways123
    Input Text    xpath=//*[@id="password"]    ways123
    Input Text    xpath=//*[@id="comfirmPassword"]    ways123
    Click Button    css=body > div > div > div > button.btn.btn-small.btn-success
    Click Element    xpath=//*[@id="modules"]/table/tbody/tr[1]/td[1]/a
    sleep    3
    Title Should Be    销量分析-整体市场
    Close Browser

Window
    open browser    https://www.baidu.com    CHROME
    Input Text    id=kw    RobotFramework
    Click Element    id=su
    Click Element    xpath=//*[@id="3"]/h3/a
    ${window}    Get Window Handles
    sleep    2
    log    ${window}
    Select Window    ${window}[0]
    sleep    3
    Title Should Be    RobotFramework_百度搜索
    Close All Browsers

ComboBox
    open browser    https://www.baidu.com    CHROME
    maximize browser window
    Mouse Over    link=设置    #鼠标悬停
    sleep    1
    Click Element    link=搜索设置
    Wait Until Element Is Visible    xpath=//*[@id="nr"]    #等到元素可见
    Select From List By Index    xpath=//*[@id="nr"]    2
    sleep    3
    Close Browser

Alert
    open browser    https://www.baidu.com    CHROME
    maximize browser window
    Mouse Over    link=设置    #鼠标悬停
    sleep    1
    Click Element    link=搜索设置
    Wait Until Element Is Visible    xpath=//*[@id="nr"]    #等到元素可见
    Select From List By Index    xpath=//*[@id="nr"]    2
    Click Element    css=#gxszButton > a.prefpanelgo
    Alert Should Be Present    text=已经记录下您的使用偏好
    Comment    ${message}    Handle Alert
    Comment    log    ${message}
    sleep    3
    Close Browser

CheckBox
    open browser    https://www.autohome.com.cn/car/    CHROME
    maximize browser window
    Select Checkbox    xpath=//*[@id="auto-grade-config"]/li[1]/label/input
    Select Checkbox    xpath=//*[@id="auto-grade-config"]/li[17]/label/input
    Unselect Checkbox    xpath=//*[@id="auto-grade-config"]/li[1]/label/input
    sleep    3
    Checkbox Should Not Be Selected    xpath=//*[@id="auto-grade-config"]/li[1]/label/input    #断言未选中
    Checkbox Should Be Selected    xpath=//*[@id="auto-grade-config"]/li[17]/label/input    #断言已选中
    Close Browser

CustomLibrary
    ${emailist}    create list    yuejing@way-s.cn    cmssystem@way-s.cn
    ${subject}    Set Variable    RF主题
    ${contents}    create list    Dear all    RF正文
    ${attachment}    create list    D://github//AutoTest//InterfaceRun.py    D://github//AutoTest//UiRun.py
    sendeml    ${emailist}    ${subject}    ${contents}    ${attachment}

IF
    ${a}    Set Variable    59
    Run Keyword If    ${a}>=90    log    优秀
    ...    ELSE IF    ${a}>=80    log    良好
    ...    ELSE IF    ${a}>=70    log    中等
    ...    ELSE IF    ${a}>=60    log    及格
    ...    ELSE    log    不及格

FOR
    : FOR    ${I}    IN RANGE    10
    \    LOG    ${I}
