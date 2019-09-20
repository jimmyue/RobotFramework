*** Settings ***
Library           Selenium2Library    implicit_wait=5

*** Test Cases ***
sousuo
    open browser    https://www.baidu.com    CHROME
    maximize browser window
    Input Text    id=kw    Robot Framework
    # Input Text    name=wd    Robot Framework
    # Input Text    class=s_ipt    Robot Framework
    # Input Text    tag=input    Robot Framework
    # Input Text    xpath=//*[@id="kw"]    Robot Framework
    # Input Text    css=#kw    Robot Framework
    Click Button    id=su
    sleep    3
    Title Should Be    Robot Framework_百度搜索
    #Click element    link=百度首页
    #Click element    partial link=百度
    sleep    3
    Close Browser
